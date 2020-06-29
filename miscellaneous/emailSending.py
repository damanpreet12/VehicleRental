import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

def notifyemail(email,body):
    try:
        msg = MIMEMultipart()
        msg['From'] = 'vermashanaya1234@gmail.com'
        msg['To'] = email
        msg['Subject'] = "Verification Email"
        msg.attach(MIMEText(body,'plain'))
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login('vermashanaya1234@gmail.com', 'shanaya#*1234')
        text=msg.as_string()
        server.sendmail(msg['From'], msg['To'],text)
        server.quit()
        return True
    except:
        return False

def linksend(email,link):
    try:
        msg = MIMEMultipart()
        msg['From'] = 'vermashanaya1234@gmail.com'
        msg['To'] = email
        msg['Subject'] = "Verification Email"
        msg.attach(MIMEText(link,'plain'))
        server = smtplib.SMTP('smtp.gmail.com', 587)
        server.starttls()
        server.login('vermashanaya1234@gmail.com', 'shanaya#*1234')
        text=msg.as_string()
        server.sendmail(msg['From'], msg['To'],text)
        server.quit()
        return True
    except:
        return False
def otpsend(email,otp):
    msg = MIMEMultipart()
    msg['From'] = 'vermashanaya1234@gmail.com'
    msg['To'] = email
    msg['Subject'] = "OTP"
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login('vermashanaya1234@gmail.com', 'shanaya#*1234')

    server.sendmail(msg['From'], email, str(otp))
    server.quit()
    return True
