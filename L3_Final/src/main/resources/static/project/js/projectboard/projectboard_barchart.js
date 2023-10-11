document.addEventListener("DOMContentLoaded", () => {
    echarts.init(document.querySelector("#barChart")).setOption({
        xAxis: {
            type: 'category',
            data: ['Critical', 'High', 'Middle', 'Low'],
            axisLabel: {
                fontWeight: 'bold' // 글꼴 굵게 설정
            }
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            data: [4, 3, 1, 2],
            type: 'bar',
            itemStyle: {
                color: function(params) { // 각 막대마다 다른 색상을 반환하는 함수
                    var colors = ['#EE6666', '#5470C6', '#91CC75', '#FACB58']; // 원하는 색상 배열
                    return colors[params.dataIndex];
                }
            }
        }]
    });
});