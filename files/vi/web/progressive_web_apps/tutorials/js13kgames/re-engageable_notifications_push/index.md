---
title: "js13kGames: Làm PWA tái tương tác bằng Notifications và Push API"
short-title: Dùng Notifications và Push API
slug: Web/Progressive_web_apps/Tutorials/js13kGames/Re-engageable_Notifications_Push
page-type: guide
sidebar: pwasidebar
---

{{PreviousMenuNext("Web/Progressive_web_apps/Tutorials/js13kGames/Installable_PWAs", "Web/Progressive_web_apps/Tutorials/js13kGames/Loading", "Web/Progressive_web_apps/Tutorials/js13kGames")}}

Việc có thể cache nội dung ứng dụng để hoạt động ngoại tuyến là một tính năng tuyệt vời. Cho phép người dùng cài web app lên thiết bị của họ còn tốt hơn nữa. Nhưng thay vì chỉ dựa vào hành động của người dùng, chúng ta có thể làm nhiều hơn, dùng push message và notifications để tự động kéo họ quay lại và mang nội dung mới tới khi có sẵn.

## Hai API, một mục tiêu

[Push API](/en-US/docs/Web/API/Push_API) và [Notifications API](/en-US/docs/Web/API/Notifications_API) là hai API riêng biệt, nhưng chúng kết hợp rất tốt khi bạn muốn cung cấp các chức năng hấp dẫn trong app của mình. Push dùng để đưa nội dung mới từ server tới app mà không cần can thiệp phía client, và việc vận hành được service worker của app xử lý. Notifications có thể được service worker dùng để hiển thị thông tin mới cho người dùng, hoặc ít nhất là cảnh báo họ khi có thứ gì đó được cập nhật.

Chúng hoạt động bên ngoài cửa sổ trình duyệt, giống như service worker, nên cập nhật có thể được đẩy tới và thông báo có thể được hiển thị ngay cả khi trang ứng dụng mất focus hoặc đã đóng.

## Thông báo

Hãy bắt đầu với notifications - chúng có thể hoạt động độc lập, nhưng sẽ hữu ích hơn khi kết hợp với push. Trước tiên, hãy xem notifications riêng lẻ.

### Yêu cầu quyền

Để hiển thị thông báo, trước tiên chúng ta phải xin quyền. Tuy nhiên, thay vì hiện thông báo ngay, thực hành tốt nhất là chỉ hiện popup khi người dùng yêu cầu bằng cách nhấp nút:

```js
const button = document.getElementById("notifications");
button.addEventListener("click", () => {
  Notification.requestPermission().then((result) => {
    if (result === "granted") {
      randomNotification();
    }
  });
});
```

Điều này hiển thị một popup bằng chính dịch vụ thông báo của hệ điều hành:

![Thông báo của js13kPWA.](js13kpwa-notification.png)

Khi người dùng xác nhận nhận thông báo, app sau đó có thể hiển thị chúng. Kết quả của hành động người dùng có thể là default, granted hoặc denied. Tùy chọn default được chọn khi người dùng không đưa ra lựa chọn, còn hai tùy chọn kia được đặt khi người dùng bấm yes hoặc no tương ứng.

Khi được chấp nhận, quyền này áp dụng cho cả notifications và push.

### Tạo thông báo

Ứng dụng mẫu tạo thông báo từ dữ liệu có sẵn - chọn ngẫu nhiên một game, và game được chọn sẽ cung cấp nội dung cho thông báo: đặt tên game làm tiêu đề, nhắc tác giả trong phần body, và dùng ảnh làm icon:

```js
function randomNotification() {
  if (!swRegistration) return;
  const randomItem = Math.floor(Math.random() * games.length);
  const notifTitle = games[randomItem].name;
  const notifBody = `Created by ${games[randomItem].author}.`;
  const notifImg = `data/img/${games[randomItem].slug}.jpg`;
  const options = {
    body: notifBody,
    icon: notifImg,
  };
  swRegistration.showNotification(notifTitle, options);
  setTimeout(randomNotification, 30000);
}
```

Mỗi 30 giây sẽ có một thông báo ngẫu nhiên mới cho tới khi nó trở nên quá phiền và bị người dùng tắt. (Với app thật, thông báo nên ít thường xuyên hơn nhiều, và hữu ích hơn.) Ưu điểm của Notifications API là nó dùng chức năng thông báo của hệ điều hành. Điều này có nghĩa là thông báo có thể hiển thị cho người dùng ngay cả khi họ không nhìn vào web app, và thông báo trông giống những thông báo do app gốc hiển thị.

## Push

Push phức tạp hơn notifications - chúng ta cần đăng ký với một server rồi server sẽ gửi dữ liệu lại cho app. Service Worker của app sẽ nhận dữ liệu từ push server, rồi có thể hiển thị bằng hệ thống thông báo, hoặc bằng cơ chế khác nếu muốn.

Công nghệ này vẫn đang ở giai đoạn rất sớm - một số ví dụ đang hoạt động dùng nền tảng Google Cloud Messaging, nhưng đang được viết lại để hỗ trợ [VAPID](https://blog.mozilla.org/services/2016/08/23/sending-vapid-identified-webpush-notifications-via-mozillas-push-service/) (Voluntary Application Identification), vốn cung cấp thêm một lớp bảo mật cho app của bạn.
Bạn có thể xem các ví dụ trong [Service Workers Cookbook](https://github.com/mdn/serviceworker-cookbook/tree/master/push-payload), thử thiết lập một server push messaging bằng [Firebase](https://firebase.google.com/), hoặc tự xây server riêng (ví dụ dùng Node.js).

Như đã nói trước đó, để nhận push message, bạn phải có service worker, và các kiến thức cơ bản đã được giải thích trong bài [Làm PWA hoạt động ngoại tuyến với Service workers](/en-US/docs/Web/Progressive_web_apps/Tutorials/js13kGames/Offline_Service_workers). Bên trong service worker, cơ chế đăng ký với push-service được tạo bằng cách gọi phương thức [`getSubscription()`](/en-US/docs/Web/API/PushManager/getSubscription) của interface [`PushManager`](/en-US/docs/Web/API/PushManager).

```js
navigator.serviceWorker
  .register("service-worker.js")
  .then((registration) => registration.pushManager.getSubscription())
  .then(/* … */);
```

Khi người dùng đã đăng ký, họ có thể nhận push notification từ server.

Từ phía server, toàn bộ quy trình phải được mã hóa bằng khóa công khai và riêng tư vì lý do bảo mật - để mọi người có thể gửi push message không an toàn qua app của bạn sẽ là một ý tưởng rất tệ. Xem trang [Web Push data encryption test page](https://jrconlin.github.io/WebPushDataTestPage/) để có thông tin chi tiết về cách bảo vệ server. Server lưu toàn bộ thông tin nhận được khi người dùng đăng ký, để các message có thể được gửi sau này khi cần.

Để nhận push message, chúng ta có thể lắng nghe sự kiện {{domxref("ServiceWorkerGlobalScope.push_event", "push")}} trong file Service Worker:

```js
self.addEventListener("push", (e) => {
  /* ... */
});
```

Dữ liệu có thể được lấy ra rồi hiển thị ngay cho người dùng dưới dạng thông báo. Điều này, chẳng hạn, có thể dùng để nhắc người dùng về điều gì đó, hoặc cho họ biết nội dung mới đã có sẵn trong app.

### Ví dụ push

Push cần phần server để hoạt động, nên chúng ta không thể đưa nó vào ví dụ js13kPWA được host trên GitHub Pages, vì nó chỉ host file tĩnh. Mọi thứ đã được giải thích trong [Service Worker Cookbook](https://github.com/mdn/serviceworker-cookbook) - xem [Push Payload Demo](https://github.com/mdn/serviceworker-cookbook/tree/master/push-payload).

Demo này gồm ba file:

- [index.js](https://github.com/mdn/serviceworker-cookbook/blob/master/push-payload/index.js), chứa mã nguồn của app
- [server.js](https://github.com/mdn/serviceworker-cookbook/blob/master/push-payload/server.js), chứa phần server (viết bằng Node.js)
- [service-worker.js](https://github.com/mdn/serviceworker-cookbook/blob/master/push-payload/service-worker.js), chứa code dành riêng cho Service Worker.

Hãy tìm hiểu từng file.

#### index.js

File `index.js` bắt đầu bằng việc đăng ký service worker:

```js
navigator.serviceWorker
  .register("service-worker.js")
  .then((registration) => registration.pushManager.getSubscription())
  .then((subscription) => {
    // subscription part
  });
```

Nó phức tạp hơn một chút so với service worker chúng ta đã thấy trong [demo js13kPWA](https://mdn.github.io/pwa-examples/js13kpwa/). Trong trường hợp cụ thể này, sau khi đăng ký, chúng ta dùng đối tượng registration để đăng ký subscription, rồi dùng đối tượng subscription kết quả để hoàn tất toàn bộ quy trình.

Ở phần đăng ký, code trông như sau:

```js
async (subscription) => {
  if (subscription) {
    return subscription;
  }
};
```

Nếu người dùng đã đăng ký rồi, chúng ta trả về đối tượng subscription và chuyển sang phần subscription. Nếu chưa, chúng ta khởi tạo một subscription mới:

```js
const response = await fetch("./vapidPublicKey");
const vapidPublicKey = await response.text();
const convertedVapidKey = urlBase64ToUint8Array(vapidPublicKey);
```

Ứng dụng lấy khóa công khai của server và chuyển response thành text; sau đó nó cần được chuyển thành Uint8Array (để hỗ trợ Chrome). Để tìm hiểu thêm về VAPID keys, bạn có thể đọc bài blog [Sending VAPID identified WebPush Notifications via Mozilla's Push Service](https://blog.mozilla.org/services/2016/08/23/sending-vapid-identified-webpush-notifications-via-mozillas-push-service/).

Bây giờ app có thể dùng {{domxref("PushManager")}} để đăng ký người dùng mới. Có hai tùy chọn được truyền vào phương thức {{domxref("PushManager.subscribe()")}} - tùy chọn đầu là `userVisibleOnly: true`, nghĩa là mọi thông báo gửi tới người dùng đều sẽ hiển thị, và tùy chọn thứ hai là `applicationServerKey`, chứa khóa VAPID mà chúng ta đã lấy và chuyển đổi thành công.

```js
registration.pushManager.subscribe({
  userVisibleOnly: true,
  applicationServerKey: convertedVapidKey,
});
```

Giờ hãy chuyển sang phần subscription - trước tiên app gửi chi tiết subscription dưới dạng JSON tới server bằng Fetch.

```js
fetch("./register", {
  method: "post",
  headers: {
    "Content-type": "application/json",
  },
  body: JSON.stringify({ subscription }),
});
```

Sau đó, hàm {{domxref("Element.click_event", "onclick")}} trên nút _Subscribe_ được định nghĩa:

```js
document.getElementById("doIt").onclick = () => {
  const payload = document.getElementById("notification-payload").value;
  const delay = document.getElementById("notification-delay").value;
  const ttl = document.getElementById("notification-ttl").value;

  fetch("./sendNotification", {
    method: "post",
    headers: {
      "Content-type": "application/json",
    },
    body: JSON.stringify({
      subscription,
      payload,
      delay,
      ttl,
    }),
  });
};
```

Khi nút được nhấp, `fetch` yêu cầu server gửi thông báo với các tham số đã cho: `payload` là văn bản sẽ hiển thị trong thông báo, `delay` định nghĩa độ trễ tính bằng giây trước khi thông báo được hiển thị, và `ttl` là thiết lập time-to-live giữ cho thông báo còn sẵn trên server trong một khoảng thời gian xác định, cũng tính bằng giây.

Giờ chuyển sang file JavaScript tiếp theo.

#### server.js

Phần server được viết bằng Node.js và cần được host ở nơi phù hợp, đây là chủ đề của một bài viết riêng. Ở đây chúng ta chỉ cung cấp cái nhìn tổng quan ở mức cao.

[module web-push](https://www.npmjs.com/package/web-push) được dùng để đặt các khóa VAPID, và tùy chọn tạo khóa nếu chúng chưa có.

```js
const webPush = require("web-push");

if (!process.env.VAPID_PUBLIC_KEY || !process.env.VAPID_PRIVATE_KEY) {
  console.log(
    "You must set the VAPID_PUBLIC_KEY and VAPID_PRIVATE_KEY " +
      "environment variables. You can use the following ones:",
  );
  console.log(webPush.generateVAPIDKeys());
  return;
}

webPush.setVapidDetails(
  "https://example.com",
  process.env.VAPID_PUBLIC_KEY,
  process.env.VAPID_PRIVATE_KEY,
);
```

Tiếp theo, một module định nghĩa và export tất cả route mà app cần xử lý: lấy public key VAPID, đăng ký, rồi gửi thông báo.
Bạn có thể thấy các biến từ file `index.js` được dùng: `payload`, `delay` và `ttl`.

```js
module.exports = (app, route) => {
  app.get(`${route}vapidPublicKey`, (req, res) => {
    res.send(process.env.VAPID_PUBLIC_KEY);
  });

  app.post(`${route}register`, (req, res) => {
    res.sendStatus(201);
  });

  app.post(`${route}sendNotification`, (req, res) => {
    const subscription = req.body.subscription;
    const payload = req.body.payload;
    const options = {
      TTL: req.body.ttl,
    };

    setTimeout(() => {
      webPush
        .sendNotification(subscription, payload, options)
        .then(() => {
          res.sendStatus(201);
        })
        .catch((error) => {
          console.log(error);
          res.sendStatus(500);
        });
    }, req.body.delay * 1000);
  });
};
```

#### service-worker.js

File cuối cùng chúng ta sẽ xem là service worker:

```js
self.addEventListener("push", (event) => {
  const payload = event.data?.text() ?? "no payload";
  event.waitUntil(
    self.registration.showNotification("ServiceWorker Cookbook", {
      body: payload,
    }),
  );
});
```

Nó chỉ thêm một listener cho sự kiện {{domxref("ServiceWorkerGlobalScope.push_event", "push")}}, tạo biến payload gồm văn bản lấy từ dữ liệu (hoặc tạo một chuỗi để dùng nếu dữ liệu trống), rồi đợi tới khi thông báo được hiển thị cho người dùng.

Hãy thoải mái khám phá các ví dụ còn lại trong [Service Worker Cookbook](https://github.com/mdn/serviceworker-cookbook) nếu bạn muốn biết chúng được xử lý như thế nào. Có một bộ sưu tập lớn các ví dụ hoạt động, bao gồm dùng chung, web push, chiến lược cache, hiệu năng, hoạt động ngoại tuyến, và nhiều hơn nữa.

{{PreviousMenuNext("Web/Progressive_web_apps/Tutorials/js13kGames/Installable_PWAs", "Web/Progressive_web_apps/Tutorials/js13kGames/Loading", "Web/Progressive_web_apps/Tutorials/js13kGames")}}
