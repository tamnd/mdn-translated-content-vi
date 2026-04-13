---
title: "XRHitTestResult: phương thức createAnchor()"
short-title: createAnchor()
slug: Web/API/XRHitTestResult/createAnchor
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRHitTestResult.createAnchor
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`createAnchor()`** của giao diện {{domxref("XRHitTestResult")}} tạo một {{domxref("XRAnchor")}} từ kết quả kiểm tra va chạm được gắn vào một đối tượng thực tế.

## Cú pháp

```js-nolint
createAnchor()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một đối tượng {{domxref("XRAnchor")}}.

## Ví dụ

### Tạo một anchor từ kết quả kiểm tra va chạm

Ví dụ sau bắt đầu với một {{domxref("XRHitTestResult")}} được truy xuất bằng cách gọi {{domxref("XRFrame.getHitTestResults()")}}. Sau khi gọi `createAnchor()`, Promise phân giải thành một {{domxref("XRAnchor")}} để đính kèm một đối tượng ảo vào vị trí đó.

```js
hitTestResult.createAnchor().then(
  (anchor) => {
    // add anchored objects to the scene
  },
  (error) => {
    console.error(`Could not create anchor: ${error}`);
  },
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRAnchor")}}
- {{domxref("XRFrame.createAnchor()")}}
