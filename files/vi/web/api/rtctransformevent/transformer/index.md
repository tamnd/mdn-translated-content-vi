---
title: "RTCTransformEvent: thuộc tính transformer"
short-title: transformer
slug: Web/API/RTCTransformEvent/transformer
page-type: web-api-instance-property
browser-compat: api.RTCTransformEvent.transformer
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`transformer`** của giao diện {{domxref("RTCTransformEvent")}} trả về {{domxref("RTCRtpScriptTransformer")}} liên kết với sự kiện.

Thuộc tính này hiển thị pipeline gửi hoặc nhận WebRTC dưới dạng một readable stream và writable stream của các khung phương tiện được mã hóa, mà một [WebRTC Encoded Transform](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms) có thể chèn vào để chỉnh sửa các khung.

## Giá trị

Một {{domxref("RTCRtpScriptTransformer")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebRTC Encoded Transforms](/en-US/docs/Web/API/WebRTC_API/Using_Encoded_Transforms)
