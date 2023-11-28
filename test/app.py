from flask import Flask,request,jsonify

import pickle
import numpy as np
model = pickle.load(open('model.pkl','rb'))
mname = pickle.load(open('mname.pkl','rb'))
com = pickle.load(open('com.pkl','rb'))



app = Flask(__name__)

@app.route('/predict',methods=['POST'])
def predict():
    print(mname,com)
    # d = {}
    # d['Query'] = str(request.args['Query'])
    # return jsonify(d)
    marketname = request.form.get('marketname')
    commodity = request.form.get('commodity')
    Date = request.form.get('Date')
    dateres = Date.split('-')
    month_column = int(dateres[1])
    year = int(dateres[2])
    currentmarketname = int(mname[marketname])
    currentcom = int(com[commodity])
    print(currentmarketname,currentcom,month_column,year)
    input_query = np.array([[currentmarketname,currentcom,month_column,abs(year)%100]])
    result = model.predict(input_query)[0]
    
    return jsonify(str(result))




if __name__ == '__main__':
    app.run(host='0.0.0.0',port=8080)