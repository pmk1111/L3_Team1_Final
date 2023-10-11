document.addEventListener("DOMContentLoaded", () => {
    var myChart = echarts.init(document.querySelector("#trafficChart"));

    var option = {
        tooltip: {
            trigger: 'item'
        },
        legend: {
            top: 'middle',
            left: 'right',
            orient: 'vertical',
            align: 'left',
            textStyle: {
                color: '#666',
                fontSize: '14',
            }
        },
        series: [{
            name: '상태',
            type: 'pie',
            radius: ['40%', '70%'],
            avoidLabelOverlap: false,
            labelLine: {
                show: false
            },
            label: {
                show: false,
                position: 'center',
                formatter: '{b}' // b refers to the name of the data item
            },
            emphasis: {
                label: {
                    show: true,
                    fontSize: '18',
                    fontWeight: 'bold'
                }
            },
            data: [{
                    value: 3,
                    name: 'To Do'
                },
                {
                    value: 1,
                    name: 'Progress'
                },
                {
                    value: 3,
                    name: 'Done'
                },
                {
                    value: 2,
                    name: 'blabla'
                }
            ]
        }]
    };

    myChart.setOption(option);
});