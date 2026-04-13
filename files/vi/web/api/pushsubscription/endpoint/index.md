---
title: "PushSubscription: endpoint property"
short-title: endpoint
slug: Web/API/PushSubscription/endpoint
page-type: web-api-instance-property
browser-compat: api.PushSubscription.endpoint
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

**`endpoint`** là thuộc tính chỉ đọc của giao diện {{domxref("PushSubscription")}} và trả về một chuỗi chứa điểm cuối được liên kết với đăng ký đẩy.

Điểm cuối này có dạng một URL tùy chỉnh trỏ đến một máy chủ đẩy, có thể được dùng để gửi một thông điệp đẩy đến thể hiện service worker cụ thể đã đăng ký vào dịch vụ đẩy. Vì lý do này, bạn nên giữ bí mật điểm cuối của mình để người khác không chiếm đoạt nó và lạm dụng chức năng đẩy.

## Giá trị

Một chuỗi.

## Ví dụ

```js
navigator.serviceWorker.ready.then((reg) => {
  reg.pushManager.subscribe({ userVisibleOnly: true }).then((subscription) => {
    console.log(subscription.endpoint);

    // Tại thời điểm này, nhiều khả năng bạn sẽ gửi điểm cuối
    // của đăng ký tới máy chủ, lưu lại, rồi dùng nó để gửi
    // một thông điệp đẩy vào thời điểm sau này
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
