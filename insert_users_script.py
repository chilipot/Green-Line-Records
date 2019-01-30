from werkzeug.security import generate_password_hash
from pprint import pprint as pp

password_hashes = []
usernames = []
data = []
with open("temp.txt", "r") as f:
    data = [line.strip() for line in f.readlines()]

    for ind,line in enumerate(data):
        username_parts = line[line.index("'") + 1 : line.index("@")].split(".")

        if len(username_parts) < 2 or "gmail" in line:
            temp_parts = [x.strip().replace("'", "").replace(")", "") for x in line.split(",")]
            #pp(temp_parts)
            username_parts = [temp_parts[1].replace(" ", "-"), temp_parts[2][:1]]
            #pp(username_parts)
        else:
            username_parts[1] = username_parts[1][:1]

        username = f'{username_parts[1].lower()}.{username_parts[0].lower()}'
        password_hash = generate_password_hash("changeme")

        d = ")"
        full_line_parts = line.split(")")#[e+d for e in line.split(d) if e]
        full_line_parts[0] = full_line_parts[0] + ", "
        full_line_parts[1] = ")" + full_line_parts[1]
        add_str = ", ".join(list(map(lambda p: "'" + p + "'", [username, password_hash])))

        full_line_parts.insert(1, add_str)

        data[ind] = ''.join(full_line_parts)

#pp(data)
data.insert(0, "insert into club_member (email, lastname, firstname, username, password_hash) values")
with open("insert_users.sql", "w") as f:
    f.write("\n".join(data))
