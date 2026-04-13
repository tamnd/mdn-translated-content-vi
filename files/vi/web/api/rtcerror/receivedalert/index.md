---
title: "RTCError: thuộc tính receivedAlert"
short-title: receivedAlert
slug: Web/API/RTCError/receivedAlert
page-type: web-api-instance-property
browser-compat: api.RTCError.receivedAlert
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`receivedAlert`** của {{domxref("RTCError")}} chỉ định lỗi {{Glossary("DTLS")}} nghiêm trọng dẫn đến một cảnh báo được nhận từ peer từ xa.

## Giá trị

Một giá trị số nguyên không dấu dài chỉ định lỗi {{Glossary("DTLS")}} nghiêm trọng dẫn đến một cảnh báo được nhận từ peer từ xa.

> [!NOTE]
> Thuộc tính này là `null` nếu `RTCError` không đại diện cho lỗi DTLS (với {{domxref("RTCError.errorDetail", "errorDetail")}} được đặt thành `dtls-failure`).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
