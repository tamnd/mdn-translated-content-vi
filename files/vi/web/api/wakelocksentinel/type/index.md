---
title: "WakeLockSentinel: type property"
short-title: type
slug: Web/API/WakeLockSentinel/type
page-type: web-api-instance-property
browser-compat: api.WakeLockSentinel.type
---

{{APIRef("Screen Wake Lock API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("WakeLockSentinel")}} trả về biểu diễn chuỗi của loại {{domxref("WakeLockSentinel")}} hiện đang được giữ.

## Giá trị

Biểu diễn chuỗi của loại khóa thức hiện đang được giữ. Hiện tại, giá trị luôn là `screen`, biểu diễn khóa thức màn hình. Nó ngăn thiết bị làm mờ hoặc khóa màn hình.

## Ví dụ

Ví dụ này cho thấy một hàm bất đồng bộ thu nhận {{domxref("WakeLockSentinel")}}, sau đó ghi loại vào console.

```js
const requestWakeLock = async () => {
  wakeLock = await navigator.wakeLock.request("screen");
  console.log(wakeLock.type); // logs 'screen'
};

requestWakeLock();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Stay awake with the Screen Wake Lock API](https://developer.chrome.com/docs/capabilities/web-apis/wake-lock/)
