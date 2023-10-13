<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8' />
    <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
    <style>
        html,
        body {
            overflow: hidden;
            font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
            font-size: 14px;

        }

        .fc-header-toolbar {
            padding-top: 1em;
            padding-left: 1em;
            padding-right: 1em;
        }
    </style>
</head>

<body style="padding:30px;">
    <div id='calendar-container'>
        <div id='calendar'></div>
    </div>
    <script>
        var calendar;

        $(function() {
            var calendarEl = $('#calendar')[0];

            calendar = new FullCalendar.Calendar(calendarEl, {
                height: '700px', // 캘린더 달력의 높이 
                expandRows: true,
                slotMinTime: '00:00',
                slotMaxTime: '23:59',
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'listWeek myCustomButton'
                },
                initialView: 'dayGridMonth',
                navLinks: true,
                editable: true,
                selectable: true,
                nowIndicator: true,
                dayMaxEvents: true,
                locale: 'ko',
                eventAdd: function(obj) {
                    console.log(obj);
                },
                eventChange: function(obj) {
                    console.log(obj);
                },
                eventRemove: function(obj) {
                    console.log(obj);
                },
                
                select: function(arg) {
                    openModal(arg);

                    calendar.unselect();
                },

                customButtons: {
                    myCustomButton: {
                        text: '일정추가',
                        click: function() {
                            openModal();
                        }
                    }
                },

                events: [{
                    title: 'Meeting',
                    start: '2023-10-11'
                }, {
                    title: 'TEST',
                    start: '2023-10-12'
                }]

            });


            calendar.render();
        });
    </script>
</body>

</html>