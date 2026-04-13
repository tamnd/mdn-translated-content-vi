---
title: "RTCDataChannelStats: thuộc tính state"
short-title: state
slug: Web/API/RTCDataChannelStats/state
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_data-channel.state
---

{{APIRef("WebRTC")}}

Thuộc tính **`state`** của từ điển `RTCDataChannelStats` trả về chuỗi cho biết {{domxref("RTCDataChannel.readyState","readyState")}} của kết nối dữ liệu nền của kênh dữ liệu: `connecting`, `open`, `closing` hoặc `closed`.

Lưu ý rằng thuộc tính này là bắt buộc.

## Giá trị

Chuỗi chứa cùng giá trị với thuộc tính {{domxref("RTCDataChannel.readyState")}} của kênh dữ liệu liên kết.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("RTCDataChannel.readyState")}}
