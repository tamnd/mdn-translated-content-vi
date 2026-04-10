---
title: "Phương thức getStats() của RTCRtpSender"
short-title: getStats()
slug: Web/API/RTCRtpSender/getStats
page-type: web-api-instance-method
browser-compat: api.RTCRtpSender.getStats
---

{{APIRef("WebRTC")}}

Phương thức **`getStats()`** của {{domxref("RTCRtpSender")}} yêu cầu bất đồng bộ một đối tượng {{domxref("RTCStatsReport")}} cung cấp thống kê về lưu lượng outgoing trên {{domxref("RTCPeerConnection")}} sở hữu sender này, trả về một {{jsxref("Promise")}} được fulfilled khi kết quả có sẵn.

## Cú pháp

```js-nolint
getStats()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} của JavaScript được fulfilled khi thống kê có sẵn.
Trình xử lý fulfillment của promise nhận được một tham số là một đối tượng {{domxref("RTCStatsReport")}} chứa thống kê đã thu thập.

`RTCStatsReport` được trả về tích lũy thống kê cho tất cả các luồng đang được gửi bằng cách sử dụng `RTCRtpSender`, cũng như thống kê cho bất kỳ phụ thuộc nào mà các luồng đó có.

Các thống kê này có thể bao gồm, ví dụ, các thống kê với [types](/en-US/docs/Web/API/RTCStatsReport#the_statistic_types): [`outbound-rtp`](/en-US/docs/Web/API/RTCOutboundRtpStreamStats), [`candidate-pair`](/en-US/docs/Web/API/RTCIceCandidatePairStats), [`local-candidate`](/en-US/docs/Web/API/RTCIceCandidateStats), [`remote-candidate`](/en-US/docs/Web/API/RTCIceCandidateStats).

## Ví dụ

Ví dụ đơn giản này lấy thống kê cho một `RTCRtpSender` và cập nhật {{domxref("HTMLElement/innerText", "innerText")}} của một phần tử để hiển thị thời gian khứ hồi hiện tại cho các yêu cầu trên sender.

```js
sender.getStats().then((stats) => {
  document.getElementById("currentRTT").innerText = stats.roundTripTime;
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCStatsReport")}}
- {{domxref("RTCRtpReceiver.getStats()")}}
- {{domxref("RTCPeerConnection.getStats()")}}
