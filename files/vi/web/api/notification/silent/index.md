---
title: "Notification: thuộc tính silent"
short-title: silent
slug: Web/API/Notification/silent
page-type: web-api-instance-property
browser-compat: api.Notification.silent
---

{{APIRef("Web Notifications")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`silent`** của giao diện {{domxref("Notification")}} chỉ định xem thông báo có nên im lặng hay không, tức là không phát âm thanh hoặc rung, bất kể cài đặt thiết bị. Điều này được điều khiển thông qua tùy chọn `silent` của constructor {{domxref("Notification.Notification","Notification()")}}.

## Giá trị

Một giá trị boolean hoặc `null`. Nếu đặt `true`, thông báo sẽ im lặng; nếu đặt `null` (giá trị mặc định), các cài đặt mặc định của thiết bị sẽ được tôn trọng.

## Ví dụ

Đoạn mã sau phát một thông báo im lặng. Một object `options` được tạo, rồi thông báo được phát để đáp lại một lần bấm nút bằng constructor {{DOMxRef("Notification.Notification","Notification()")}}. Mã cũng bao gồm xử lý quyền đơn giản, yêu cầu quyền từ người dùng để phát thông báo nếu quyền chưa được cấp.

```js
const btn = document.querySelector("button");

const options = {
  body: "No annoying pings or vibrations?",
  silent: true,
};

function requestSilentNotification() {
  const n = new Notification("Silent notification", options);
  console.log(n.silent); // should return true
}

btn.addEventListener("click", () => {
  if (Notification.permission === "granted") {
    requestSilentNotification();
  } else {
    Notification.requestPermission().then((permission) => {
      if (permission === "granted") {
        requestSilentNotification();
      } else {
        console.log("Notification permission was not granted");
      }
    });
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
