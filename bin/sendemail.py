"""Sends email to customers"""

import sys
import json
import smtplib

def read_in():
    """Read input data from terraform"""
    try:
        lines = {x.strip() for x in sys.stdin}
        for line in lines:
            if line:
                jsondata = json.loads(line)
        return jsondata
    except Exception as e:
        return {}

def send_email():
    """
    Sends actual email to end user
    """
    conf_data = read_in()

    with smtplib.SMTP(conf_data['smtp_server'], conf_data['port']) as server:
        server.sendmail(
            from_addr=conf_data['sender_email'], 
            to_addrs=conf_data['receiver_email'], 
            msg=conf_data['message']
            )
    sys.stdout.write(json.dumps(conf_data))
        


if __name__ == "__main__":
    try:
        send_email()
    except Exception as e:
        sys.exit(1)
    
     