---
title: "Notification: thuộc tính lang"
short-title: lang
slug: Web/API/Notification/lang
page-type: web-api-instance-property
browser-compat: api.Notification.lang
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`lang`** của giao diện {{domxref("Notification")}} cho biết ngôn ngữ được dùng trong thông báo, như được chỉ định trong tùy chọn `lang` của constructor {{domxref("Notification.Notification","Notification()")}}.

Bản thân ngôn ngữ được chỉ định bằng một chuỗi đại diện cho một {{glossary("BCP 47 language tag")}}.

## Giá trị

Một chuỗi chỉ định thẻ ngôn ngữ.

## Ví dụ

Đoạn mã sau phát một thông báo; một object `options` đơn giản được tạo rồi thông báo được phát bằng constructor `Notification()`.

```js
const options = {
  body: "Your code submission has received 3 new review comments.",
  lang: "en-US",
};

const n = new Notification("New review activity", options);

console.log(n.lang); // "en-US"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
