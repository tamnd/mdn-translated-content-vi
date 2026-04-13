---
title: "Notification: thuộc tính dir"
short-title: dir
slug: Web/API/Notification/dir
page-type: web-api-instance-property
browser-compat: api.Notification.dir
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`dir`** của giao diện {{domxref("Notification")}} cho biết hướng văn bản của thông báo, như được chỉ định trong tùy chọn `dir` của constructor {{domxref("Notification.Notification","Notification()")}}.

## Giá trị

Một chuỗi chỉ định hướng văn bản. Các giá trị có thể là:

- `auto`
  - : kế thừa hành vi cài đặt ngôn ngữ của trình duyệt (mặc định).
- `ltr`
  - : từ trái sang phải.
- `rtl`
  - : từ phải sang trái.

> [!NOTE]
> Hầu hết trình duyệt dường như bỏ qua các thiết lập `ltr` và `rtl` tường minh, và chỉ dùng thiết lập chung của trình duyệt.

## Ví dụ

Đoạn mã sau phát một thông báo; một object `options` đơn giản được tạo rồi thông báo được phát bằng constructor `Notification()`.

```js
const options = {
  body: "Your code submission has received 3 new review comments.",
  dir: "rtl",
};

const n = new Notification("New review activity", options);

console.log(n.dir); // "rtl"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
