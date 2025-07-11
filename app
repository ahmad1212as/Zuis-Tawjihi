<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Locked</title>
    <style>
        body {
            background-color: red;
            color: white;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            flex-direction: column;
            text-align: center;
        }
        .header {
            font-size: 4vw;
            font-weight: bold;
            margin-bottom: 2vh;
        }
        .warning-text {
            font-size: 5vw;
            font-weight: bold;
            margin-bottom: 2vh;
        }
        .warning-icons {
            font-size: 8vw;
        }
        .warning-icons::before {
            content: ⚠️ ⚠️ ⚠️";
        }
    </style>
</head>
<body>

    <div class="header" id="date-time"></div>
    <div class="warning-text">
        Page Locked. Contact the Owner
    </div>
    <div class="warning-icons"></div>

    <script>
        function updateDateTime() {
            const now = new Date();
            const dateTime = now.toLocaleString('en-US', {
                weekday: 'long', year: 'numeric', month: 'long', day: 'numeric',
                hour: '2-digit', minute: '2-digit', second: '2-digit', hour12: true
            });
            document.getElementById('date-time').textContent = dateTime;
        }

        updateDateTime();
        setInterval(updateDateTime, 1000); // Update every second
    </script>

</body>
</html>
