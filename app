<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>تسجيل الدخول</title>
  <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@400;600;700&display=swap" rel="stylesheet" />
  <style>
    /* الخط والاعدادات العامة */
    * {
      box-sizing: border-box;
    }
    body, html {
      margin: 0; padding: 0;
      width: 100%; height: 100%;
      font-family: 'Cairo', sans-serif;
      background: linear-gradient(
          rgba(0, 0, 0, 0.5),
          rgba(0, 0, 0, 0.5)
        ),
        url('https://www.raed.net/img?id=1377900') no-repeat center center fixed;
      background-size: cover;
      color: #222;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      -webkit-font-smoothing: antialiased;
      -moz-osx-font-smoothing: grayscale;
    }

    .container {
      background: #fff;
      border-radius: 25px;
      box-shadow:
        0 8px 24px rgba(0, 0, 0, 0.15),
        0 0 30px rgba(0, 123, 255, 0.15);
      width: 380px;
      max-width: 95vw;
      padding: 40px 35px 50px;
      position: relative;
      overflow: hidden;
      animation: fadeSlideIn 0.8s ease forwards;
    }

    @keyframes fadeSlideIn {
      from {
        opacity: 0;
        transform: translateY(40px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    h2 {
      text-align: center;
      font-weight: 700;
      font-size: 26px;
      margin-bottom: 28px;
      color: #007bff;
      letter-spacing: 1px;
    }

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 15px 18px;
      margin-bottom: 20px;
      border-radius: 15px;
      border: 1.8px solid #ccc;
      font-size: 16px;
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
      outline: none;
      font-weight: 600;
      color: #333;
      background-color: #fefefe;
    }

    input[type="text"]:focus,
    input[type="password"]:focus {
      border-color: #007bff;
      box-shadow: 0 0 8px rgba(0, 123, 255, 0.5);
      background-color: #fff;
    }

    button {
      width: 100%;
      padding: 16px 0;
      border: none;
      border-radius: 20px;
      background: linear-gradient(90deg, #007bff, #0056b3);
      color: white;
      font-size: 18px;
      font-weight: 700;
      cursor: pointer;
      box-shadow: 0 5px 15px rgba(0, 123, 255, 0.4);
      transition: background 0.3s ease, transform 0.2s ease;
    }

    button:hover:not(:disabled) {
      background: linear-gradient(90deg, #0056b3, #004494);
      transform: scale(1.05);
    }

    button:disabled {
      background: #a0c1ff;
      cursor: not-allowed;
      transform: none;
      box-shadow: none;
    }

    .spinner {
      margin: 18px auto 24px;
      width: 36px;
      height: 36px;
      border: 5px solid #ddd;
      border-top-color: #007bff;
      border-radius: 50%;
      animation: spin 1s linear infinite;
      display: none;
    }

    @keyframes spin {
      to {
        transform: rotate(360deg);
      }
    }

    /* الروابط الإضافية */
    .extra-links {
      text-align: center;
      margin-top: 24px;
      font-size: 15px;
    }

    .extra-links a {
      color: #007bff;
      cursor: pointer;
      text-decoration: none;
      margin: 0 12px;
      font-weight: 600;
      transition: color 0.3s ease;
    }

    .extra-links a:hover {
      text-decoration: underline;
      color: #004494;
    }

    /* إشعار التنبيهات */
    #notification {
      position: fixed;
      top: 20px;
      left: 50%;
      transform: translateX(-50%);
      background-color: #007bff;
      color: #fff;
      padding: 14px 28px;
      border-radius: 30px;
      box-shadow: 0 4px 15px rgba(0, 123, 255, 0.4);
      font-weight: 700;
      font-size: 16px;
      opacity: 0;
      pointer-events: none;
      transition: opacity 0.5s ease;
      z-index: 9999;
      max-width: 90%;
      text-align: center;
      word-break: break-word;
      white-space: normal;
    }
    #notification.show {
      opacity: 1;
      pointer-events: auto;
    }
    #notification.error {
      background-color: #d9534f;
      box-shadow: 0 4px 15px rgba(217, 83, 79, 0.5);
    }
    #notification.success {
      background-color: #28a745;
      box-shadow: 0 4px 15px rgba(40, 167, 69, 0.5);
    }

    /* صندوق استرجاع الحساب */
    #forgotBox {
      display: none;
    }

    /* صندوق محتويات استرجاع الحساب */
    .output-box {
      background: #f1f1f1;
      padding: 14px 18px;
      margin-top: 16px;
      border-radius: 15px;
      font-size: 15px;
      box-shadow: inset 0 0 12px rgba(0, 0, 0, 0.05);
      color: #222;
      line-height: 1.5;
      word-break: break-word;
      user-select: text;
    }

    /* سهم الرجوع */
    .back-arrow {
      position: absolute;
      top: 18px;
      left: 18px;
      width: 30px;
      height: 30px;
      cursor: pointer;
      user-select: none;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: stroke 0.3s ease;
      color: #555;
    }

    .back-arrow:hover svg path {
      stroke: #007bff;
    }

    /* أيقونة النسخ */
    .copy-icon {
      width: 20px;
      cursor: pointer;
      vertical-align: middle;
      margin-left: 8px;
      filter: drop-shadow(0 0 1px #aaa);
      transition: filter 0.3s ease;
    }
    .copy-icon:hover {
      filter: drop-shadow(0 0 4px #007bff);
    }
  </style>
</head>
<body>

  <!-- إشعار التنبيهات -->
  <div id="notification" role="alert" aria-live="assertive"></div>

  <div class="container" id="loginBox">
    <h2>تسجيل الدخول</h2>
    <input type="text" id="username" placeholder="اسم المستخدم" autocomplete="username" aria-label="اسم المستخدم" />
    <input type="password" id="password" placeholder="كلمة السر" autocomplete="current-password" aria-label="كلمة السر" />
    <button id="loginBtn" aria-label="زر تسجيل الدخول">دخول</button>
    <div class="spinner" id="spinner" aria-hidden="true"></div>

    <div class="extra-links">
      <a href="https://www.instagram.com/ahmad_algwary/" target="_blank" rel="noopener noreferrer" aria-label="إنشاء حساب على انستجرام">إنشاء حساب</a>
      <a onclick="toggleForgot(true)" role="button" tabindex="0" aria-label="نسيت كلمة المرور">نسيت كلمة المرور؟</a>
    </div>
  </div>

  <!-- صندوق استرجاع الحساب -->
  <div class="container" id="forgotBox" aria-hidden="true">
    <div class="back-arrow" onclick="toggleForgot(false)" role="button" tabindex="0" aria-label="العودة لتسجيل الدخول" aria-hidden="false">
      <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" focusable="false">
        <path d="M15 18L9 12L15 6" stroke="#555" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
    </div>
    <h2>استرجاع الحساب</h2>
    <input type="text" id="phone" placeholder="رقم الهاتف" autocomplete="tel" aria-label="رقم الهاتف" />
    <input type="text" id="code" placeholder="رمز الأمان" autocomplete="one-time-code" aria-label="رمز الأمان" />
    <button onclick="recoverAccount()" aria-label="زر استرجاع البيانات">استرجاع البيانات</button>

    <div id="recoveredData" class="output-box" aria-live="polite" aria-atomic="true"></div>
  </div>

<script>
  // فك ترميز URL مخزن base64
  function decodeBase64(str) {
    return decodeURIComponent(escape(window.atob(str)));
  }
  const encodedUrl = "aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL2FobWFkMTIxMmFzL1p1aXMtVGF3amloaS9yZWZzL2hlYWRzL21haW4vaW5mb3JtYXRpb24=";
  const dataURL = decodeBase64(encodedUrl);

  const loginBtn = document.getElementById('loginBtn');
  const spinner = document.getElementById('spinner');
  const notification = document.getElementById('notification');

  function showNotification(text, type = 'success') {
    notification.textContent = text;
    notification.className = '';
    notification.classList.add(type, 'show');
    setTimeout(() => notification.classList.remove('show'), 5000);
  }

  function toggleForgot(show) {
    const loginBox = document.getElementById('loginBox');
    const forgotBox = document.getElementById('forgotBox');
    if (show) {
      loginBox.style.display = 'none';
      forgotBox.style.display = 'block';
      forgotBox.setAttribute('aria-hidden', 'false');
      loginBox.setAttribute('aria-hidden', 'true');
    } else {
      forgotBox.style.display = 'none';
      loginBox.style.display = 'block';
      forgotBox.setAttribute('aria-hidden', 'true');
      loginBox.setAttribute('aria-hidden', 'false');
    }
  }

  // استرجاع الحساب
  function recoverAccount() {
    const phone = document.getElementById('phone').value.trim();
    const code = document.getElementById('code').value.trim();

    if (!phone || !code) {
      showNotification('يرجى إدخال رقم الهاتف ورمز الأمان', 'error');
      return;
    }

    spinner.style.display = 'block';
    loginBtn.disabled = true;

    fetch(dataURL)
      .then(res => res.json())
      .then(users => {
        const found = users.find(u => u.phone === phone && u.code === code);
        if (found) {
          const info = `
            اسم المستخدم: ${found.username}
            كلمة السر: ${found.password}
          `;
          const recoveredDiv = document.getElementById('recoveredData');
          recoveredDiv.textContent = info;
          showNotification('تم استرجاع البيانات بنجاح', 'success');
        } else {
          showNotification('رقم الهاتف أو رمز الأمان غير صحيح', 'error');
        }
      })
      .catch(() => {
        showNotification('فشل الاتصال بقاعدة البيانات', 'error');
      })
      .finally(() => {
        spinner.style.display = 'none';
        loginBtn.disabled = false;
      });
  }

  // تسجيل الدخول + فتح صفحة html من رابط raw داخل نافذة منبثقة
  loginBtn.addEventListener('click', () => {
    const user = document.getElementById('username').value.trim();
    const pass = document.getElementById('password').value.trim();

    if (!user || !pass) {
      showNotification('يرجى إدخال اسم المستخدم وكلمة السر', 'error');
      return;
    }

    spinner.style.display = 'block';
    loginBtn.disabled = true;

    // فتح نافذة جديدة فارغة
    const popup = window.open('', '_blank', 'width=900,height=600,scrollbars=yes');

    fetch(dataURL)
      .then(res => res.json())
      .then(users => {
        const found = users.find(u => u.username === user && u.password === pass);
        if (found) {
          showNotification('تم تسجيل الدخول بنجاح!', 'success');

          // جلب محتوى صفحة الـ HTML من الرابط raw
          fetch('https://raw.githubusercontent.com/ahmad1212as/zuis/refs/heads/main/Unit%208.html')
            .then(res => res.text())
            .then(htmlCode => {
              popup.document.open();
              popup.document.write(htmlCode);
              popup.document.close();
            })
            .catch(() => {
              popup.document.write('<h2>حدث خطأ في تحميل الصفحة</h2>');
            });

        } else {
          showNotification('اسم المستخدم أو كلمة السر غير صحيحة', 'error');
          popup.close();
        }
      })
      .catch(() => {
        showNotification('فشل الاتصال بقاعدة البيانات', 'error');
        popup.close();
      })
      .finally(() => {
        spinner.style.display = 'none';
        loginBtn.disabled = false;
      });
  });
</script>

</body>
</html>

