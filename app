<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
  <meta charset="UTF-8">
  <title>موقعي الشخصي</title>
  <style>
    body {
      font-family: Tahoma, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
    }

    header {
      background-color: #333;
      color: white;
      padding: 40px 20px;
      text-align: center;
    }

    header h1 {
      margin: 0;
      font-size: 2.5em;
    }

    header p {
      margin-top: 10px;
      font-size: 1.2em;
    }

    section {
      padding: 30px 20px;
      max-width: 600px;
      margin: auto;
      background: white;
      margin-top: 30px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    form input, form textarea {
      width: 100%;
      padding: 12px;
      margin: 10px 0;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 1em;
    }

    form button {
      background-color: #007bff;
      color: white;
      border: none;
      padding: 12px 20px;
      font-size: 1em;
      border-radius: 5px;
      cursor: pointer;
    }

    form button:hover {
      background-color: #0056b3;
    }

    #status {
      margin-top: 10px;
      font-weight: bold;
      color: green;
    }
  </style>
</head>
<body>

  <header>
    <h1>مرحباً، أنا مطوّر ويب</h1>
    <p>هذا موقعي الشخصي بلغة HTML و CSS و JavaScript فقط</p>
  </header>

  <section id="contact">
    <h2>تواصل معي</h2>
    <form id="contact-form">
      <input type="text" name="name" placeholder="الاسم" required>
      <input type="email" name="email" placeholder="البريد الإلكتروني" required>
      <textarea name="message" placeholder="رسالتك" required></textarea>
      <button type="submit">إرسال</button>
    </form>
    <p id="status"></p>
  </section>

  <script>
    // محاكاة إرسال البيانات (بدون سيرفر حقيقي)
    document.getElementById('contact-form').addEventListener('submit', function(e) {
      e.preventDefault();
      const name = this.name.value;
      const email = this.email.value;
      const message = this.message.value;

      // عرض رسالة تم الإرسال
      document.getElementById('status').innerText = "✅ تم استلام رسالتك بنجاح، شكرًا لك يا " + name + "!";
      
      // إعادة تعيين النموذج
      this.reset();
    });
  </script>

</body>
</html>
