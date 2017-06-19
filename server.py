#!/usr/bin/env Python
# coding=utf-8

from http.server import HTTPServer, BaseHTTPRequestHandler
from database import DBManagement


class MyHttpHandler(BaseHTTPRequestHandler):
    dbmanager = DBManagement()

    def _writeheaders(self):
        self.send_response(200)
        self.send_header("Content-type", "text/html")
        self.end_headers()

    def _commandprocess(self):
        command_line = self.path.split("?")
        command = command_line[0]
        attributes = command_line[len(command_line) - 1]
        if command == '/login':
            username_pwd = attributes.split("&")
            username = username_pwd[0].split("=")[1]
            pwd = username_pwd[1].split("=")[1]
            if pwd == self.dbmanager.search_for_pwd(username):
                return "yes"
            else:
                return "no"

        if command == '/register':
            username_pwd = attributes.split("&")
            username = username_pwd[0].split("=")[1]
            pwd = username_pwd[1].split("=")[1]
            sucess = self.dbmanager.add_new_person(username, pwd)
            if sucess == 1:
                return "yes"
            else:
                return "no"

        if command == '/message':
            username = attributes.split("=")[1]
            messages = self.dbmanager.search_for_new_message(username)
            message_str = ''
            if messages is None:
                return '0'
            length = len(messages)
            message_str += str(length)
            for i in range(0, len(messages)):
                if messages[i][0] == "110":
                    message_str = message_str + '|' + messages[i][0] + '|' + messages[i][1] + '|' + "系统"
                else:
                    message_str = message_str + '|' + messages[i][0] + '|' + messages[i][1] + '|' + messages[i][2]
            return message_str

        if command == '/send':
            info = attributes.split("&")
            values = [info[0].split("=")[1], info[1].split("=")[1], info[2].split("=")[1], info[3].split("=")[1]]
            num = self.dbmanager.send_new_message(values)
            if num > 0:
                return "yes"
            else:
                return "no"

        if command == '/allcommodities':
            demand = attributes.split("=")[1]
            allcommodities = list(self.dbmanager.search_for_commodities())
            commodities = []

            if allcommodities is None:
                return '0'
            for commodity in allcommodities:
                if demand in commodity[0] or demand in commodity[2]:
                    commodities.append(commodity)

            commodities_str = str(len(commodities))
            for i in range(0, len(commodities)):
                commodities_str += '|' + commodities[i][0] + '|' + commodities[i][1] + '|' + commodities[i][
                    2] + '|' + commodities[i][3].decode(encoding="utf-8") + '|' + commodities[i][4].decode(
                    encoding="utf-8") + '|' + str(commodities[i][5]) + '|' + commodities[i][6]

            return commodities_str

        if command == '/typecommodities':
            info = attributes.split("&")
            type = info[0].split("=")[1]
            demand = info[1].split("=")[1]
            allcommodities = list(self.dbmanager.search_for_type_commodities(type))
            commodities = []
            if allcommodities is None:
                return '0'
            if demand != "all":
                for commodity in allcommodities:
                    if demand in commodity[0] or demand in commodity[1]:
                        commodities.append(commodity)
            else:
                for commodity in allcommodities:
                    commodities.append(commodity)
            commodities_str = str(len(commodities))
            for i in range(0, len(commodities)):
                commodities_str += '|' + commodities[i][0] + '|' + commodities[i][1] + '|' + commodities[i][2].decode(
                    encoding="utf-8") + '|' + \
                                   commodities[i][3].decode(encoding="utf-8") + '|' + commodities[i][4] + '|' + \
                                   commodities[i][5]

            print(commodities_str)
            return commodities_str

        if command == '/newcommodity':
            info = attributes.split("&")
            values = []
            for i in info:
                values.append(i.split("=")[1])
            values[3] = values[3].encode(encoding="utf-8")
            values[4] = values[4].encode(encoding="utf-8")
            num = self.dbmanager.add_new_commodity(values)
            if num > 0:
                return "yes"
            else:
                return "np"

        if command == '/getuser':
            user_id = attributes.split("=")[1]
            user_info = self.dbmanager.search_for_user_information(user_id)
            if user_info is None:
                return "0"
            user_string = user_info[0] + '|' + user_info[1] + '|' + str(user_info[2]) + '|'
            print(user_string)
            return user_string

        if command == '/updatename':
            name_id = attributes.split("&")
            values = []
            values.append(name_id[0].split("=")[1])
            values.append(name_id[1].split("=")[1])
            success = self.dbmanager.update_name(values)
            if success > 0:
                return "yes"
            else:
                return "no"

        if command == '/updatedescription':
            des_id = attributes.split("&")
            values = []
            values.append(des_id[0].split("=")[1])
            values.append(des_id[1].split("=")[1])
            success = self.dbmanager.update_description(values)
            if success > 0:
                return "yes"
            else:
                return "no"

        if command == '/updategender':
            gender_id = attributes.split("&")
            print(gender_id)
            values = []
            values.append(gender_id[0].split("=")[1])
            values.append(gender_id[1].split("=")[1])
            success = self.dbmanager.update_gender(values)
            if success > 0:
                return "yes"
            else:
                return "no"

        if command == 'getprofile':
            id = attributes.split("=")[1]
            profile = self.dbmanager.get_profile(id)
            if profile == 0:
                return "no"
            else:
                return profile

        return "No Method"

    def do_GET(self):
        self._writeheaders()
        r_str = self._commandprocess()
        encoded = ''.join(r_str).encode("UTF-8")
        self.wfile.write(encoded)

        # def do_POST(self):


httpd = HTTPServer(('', 8888), MyHttpHandler)
print("Server started on 127.0.0.1,port 8888.....")
httpd.serve_forever()
