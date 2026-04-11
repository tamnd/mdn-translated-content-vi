---
title: Cài đặt
slug: Web/API/WebRTC_API/Build_a_phone_with_peerjs/Setup
page-type: guide
---

{{DefaultAPISidebar("WebRTC")}}

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Build_the_server")}}

Vì vậy, hãy bắt đầu bằng cách thiết lập nền tảng cho ứng dụng điện thoại hỗ trợ WebRTC của chúng tôi.

1. Trước tiên, hãy tìm một vị trí hợp lý trên cấu trúc tệp cục bộ của bạn và chạy `mkdir audio_app`, sau đó `cd audio_app` để tạo một thư mục chứa ứng dụng của bạn và nhập vào đó.
2. Tiếp theo, tạo một ứng dụng mới bằng cách chạy `yarn init`. Làm theo lời nhắc, cung cấp tên, phiên bản, mô tả, v.v. cho dự án của bạn.
3. Tiếp theo, cài đặt các phần phụ thuộc cần thiết bằng các lệnh sau:
   - [Thể hiện](https://expressjs.com/): `yarn add express`
   - [ngang hàng](https://peerjs.com/): `yarn add peerjs`
   - [ngang hàng](https://github.com/peers/peerjs-server): `yarn add peer`

   Peer sẽ được sử dụng cho máy chủ ngang hàng và PeerJS sẽ được sử dụng để truy cập API và khung PeerJS. `package.json` của bạn sẽ trông như thế này khi bạn cài đặt xong các phần phụ thuộc:

   ```json
   {
     "name": "audio_app",
     "version": "1.0.0",
     "description": "An audio app using WebRTC",
     "scripts": {
       "start": "node server.js",
       "test": "echo \"Error: no test specified\" && exit 1"
     },
     "keywords": [],
     "author": "Lola Odelola",
     "license": "MIT",
     "dependencies": {
       "express": "^4.17.1",
       "peer": "^0.5.3",
       "peerjs": "^1.3.1"
     }
   }
   ```

4. Để hoàn tất quá trình thiết lập, bạn nên sao chép các tệp HTML và CSS sau vào thư mục gốc của thư mục dự án. Bạn có thể đặt tên cho cả hai tệp là `index`, do đó tệp HTML sẽ là `index.html` và tệp CSS sẽ là `index.css`. Bạn sẽ không cần phải sửa đổi nhiều điều này trong các bài viết tiếp theo.

```html
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Lola's Web Phone!</title>
    <meta
      property="og:description"
      content="Cast your computer to your devices as a teleprompter" />

    <!-- import the webpage's stylesheet -->
    <link rel="stylesheet" href="/index.css" />
    <!-- import the javascript -->
    <script src="script.js" defer></script>
    <script src="https://unpkg.com/peerjs@1.3.1/dist/peerjs.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/davidshimjs-qrcodejs@0.0.2/qrcode.min.js"></script>
  </head>
  <body>
    <div class="container">
      <h1>Phone a friend</h1>
      <p id="cast-status" class="big">Connecting...</p>
      <p>Please use headphones!</p>
      <button class="call-btn">Call</button>
      <section class="call-container" hidden>
        <div class="audio-container">
          <p>You're automatically muted, unmute yourself!</p>
          <audio controls id="remoteAudio" muted="true"></audio>
          <audio controls id="localAudio" muted="true"></audio>
        </div>
        <button class="hangup-btn">Hang up</button>
      </section>
    </div>

    <section class="modal" hidden>
      <div id="close">close</div>
      <div class="inner-modal">
        <label>Give us your friend's device ID</label>
        <input placeholder="Enter your friend's device ID" aria-colcount="10" />
        <button class="connect-btn">Connect</button>
      </div>
    </section>
  </body>
</html>
```

```css
*,
*::before,
*::after {
  box-sizing: border-box;
}

body {
  color: darkslategrey;
  display: flex;
  align-items: center;
  justify-content: center;
  background: antiquewhite;
}

h1 {
  font-size: 6rem;
  letter-spacing: 0.2rem;
  margin-bottom: auto;
}

p {
  text-align: center;
  font-size: 2rem;
}

button {
  background-color: light-dark(white, black);
  padding: 1rem 10rem;
  border-radius: 3rem;
  border: none;
  cursor: pointer;
}

.call-btn {
  background-color: darkslategrey;
  color: antiquewhite;
  font-size: 3rem;
  margin-left: 7rem;
}

.hangup-btn {
  background-color: darkred;
  color: white;
  font-size: 1.5rem;
  margin-left: 6rem;
  margin-top: 4rem;
}

.modal {
  padding: 5rem;
  background-color: whitesmoke;
  border-radius: 2rem;
  width: 40rem;
  height: 20rem;
}

.inner-modal {
  text-align: center;
}

.modal label {
  font-size: 1.5rem;
}
.modal input {
  margin: 1rem 7rem 3rem;
  display: block;
  padding: 1rem;
  border-radius: 3rem;
  box-shadow: 0 0 15px 4px rgb(0 0 0 / 0.19);
  border: none;
  width: 50%;
}

.connect-btn {
  background-color: #0c1d1d;
  color: whitesmoke;
  font-size: 1.5rem;
}
```

{{PreviousMenuNext("Web/API/WebRTC_API/Build_a_phone_with_peerjs", "Web/API/WebRTC_API/Build_a_phone_with_peerjs/Build_the_server")}}
