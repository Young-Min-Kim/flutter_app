import warnings
import FinanceDataReader as fdr
import matplotlib.pyplot as plt
from matplotlib.figure import Figure
import pandas as pd
import numpy as np

from datetime import datetime
from dateutil.relativedelta import relativedelta

from flask import Flask

app = Flask(__name__)


@app.route('/')
@app.route('/home')
def home():
    return 'Hello, World!'


@app.route('/user')
def user():
    return 'Hello, User!'


@app.route('/stock')
def stock():
    # 스톡 코드는 추후 입력값으로 받을 예정
    STOCK_CODE = '005930'
    data = fdr.DataReader(STOCK_CODE)

    # 종가만 추출
    close = data['Close']

    # 비교 기준 구간 설정
    end_date = datetime.now()
    end_date = end_date - relativedelta(days=1)
    start_date = end_date - relativedelta(days=20)


    start_date = start_date.strftime('%Y-%m-%d')
    end_date = end_date.strftime('%Y-%m-%d')
    start_date

    base = close[start_date:end_date]
    base_norm = (base - base.min()) / (base.max() - base.min())
    # 윈도우 사이즈
    window_size = len(base)

    # 예측 기간
    next_date = 5

    # 검색 횟수
    moving_cnt = len(base) - window_size - next_date - 1
    # 유사도 저장 딕셔너리
    sim_list = []

    for i in range(moving_cnt):
        target = close[i:i+window_size]

        # Normalize
        target_norm = (target - target.min()) / (target.max() - target.min())

        # 코사인 유사도 저장
        cos_similarity = cosine(base_norm, target_norm)

        # 코사인 유사도 <- i(인덱스), 시계열데이터 함께 저장
        sim_list.append(cos_similarity)

    idx = 3193

    top_ = close[idx:idx+window_size+next_date]
    top_norm = (top_ - top_.min()) / (top_.max() - top_.min())

    base_norm = pd.DataFrame(base_norm)
    base_norm_makejson = base_norm.reset_index()
    top_norm = pd.DataFrame(top_norm)
    top_norm_makejson = top_norm.reset_index()

    top_norm_makejson['forcast_Close'] = top_norm_makejson[['Close']]
    top_norm_makejson[['y_Close']] = base_norm_makejson[['Close']]
    top_norm_makejson = top_norm_makejson[['y_Close', 'forcast_Close']]

    json_file = top_norm_makejson.to_json(orient='index')
    return json_file


if __name__ == '__main__':
    app.run(debug=True)
