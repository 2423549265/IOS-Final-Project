import pymysql
import sys

from pip._vendor.requests.packages import chardet


class DBManagement:
    conn = ''
    cursor = ''
    conv_no = 0

    def __init__(self):
        self.conn = pymysql.connect(host='localhost', port=3306, user='root', passwd='940623', db='NJUSecondHand',
                               charset='utf8')
        self.cursor = self.conn.cursor()

    def search_for_pwd(self, username):
        num = self.cursor.execute("select password from User WHERE ID = %s", username)
        if num == 0:
            return None
        else:
            rows = self.cursor.fetchone()
            return rows[0]

    def add_new_person(self, username, pwd):
        num = self.cursor.execute("select * from User where ID = %s", username)
        if num > 0:
            return 0

        values = []
        values.append(username)
        values.append(pwd)
        values.append(username)
        self.cursor.execute("insert into User(ID, password, name, introduction, gender) VALUES(%s,%s,%s,'hello world','1')",values)
        self.conn.commit()

        return 1

    def search_for_new_message(self,username):
        num = self.cursor.execute("select senderID, message, senderName from Conversation where receiverID = %s", username)
        if num == 0:
            return None
        rows = self.cursor.fetchall()
        self.cursor.execute("delete from Conversation where receiverID = %s", username)
        self.conn.commit()
        return rows

    def send_new_message(self, values):
        if values[1] == "110":
            temp = values[0]
            values[0] = values[1]
            values[1] = temp
        if self.conv_no == 0:
            num = self.cursor.execute("insert into Conversation(no,senderID, receiverID, message, senderNAME ) VALUES(1,%s,%s,%s,%s)", values)
            self.conv_no+=1
        else:
            num = self.cursor.execute(
                "insert into Conversation(senderID, receiverID, message, senderNAME ) VALUES(%s,%s,%s,%s)", values)
        self.conn.commit()
        return num

    def search_for_commodities(self):
        num = self.cursor.execute("select name, category, description, photo1, photo2, price, seller from Commodities")
        if num == 0:
            return None
        rows = self.cursor.fetchall()
        return rows

    def search_for_type_commodities(self, type):
        num = self.cursor.execute("select name, description, photo1, photo2, price, seller from Commodities where category = %s", type)
        if num == 0:
            return None
        rows = self.cursor.fetchall()
        return rows

    def add_new_commodity(self, values):
        num = self.cursor.execute("insert into Commodities(name, category, description, photo1, photo2, price, seller) VALUES(%s,%s,%s,%s,%s,%s,%s)", values)
        self.conn.commit()
        return num

    def search_for_user_information(self, userID):
        num = self.cursor.execute("select name, introduction, gender, gravatar from User where ID = %s", userID)
        if num == 0:
            return None
        person = self.cursor.fetchone()

        # person[3] = person[3]

        return person

    def update_name(self, values):
        num = self.cursor.execute("update User set name = %s where ID = %s", values)
        self.conn.commit()
        return num

    def update_description(self, values):
        num = self.cursor.execute("update User set introduction = %s where ID = %s", values)
        self.conn.commit()
        return num

    def update_gender(self, values):
        num = self.cursor.execute("update User set gender = %s where ID = %s", values)
        self.conn.commit()
        return num

    def get_profile(self, id):
        num = self.cursor.execute("select gravatar from User where id = %s", id)
        if num == 0:
            return None
        profile  = self.cursor.fetchall()
        return profile


    def __del__(self):
        self.cursor.close()
        self.conn.close()


# manager = DBManagement()
# manager.search_for_new_message('131160039')