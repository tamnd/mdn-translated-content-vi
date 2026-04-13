---
title: "RTCRtpReceiver: phương thức getStats()"
short-title: getStats()
slug: Web/API/RTCRtpReceiver/getStats
page-type: web-api-instance-method
browser-compat: api.RTCRtpReceiver.getStats
---

{{APIRef("WebRTC")}}

Phương thức {{domxref("RTCRtpReceiver")}} **`getStats()`** yêu cầu không đồng bộ một đối tượng {{domxref("RTCStatsReport")}} cung cấp thống kê về lưu lượng đi vào trên {{domxref("RTCPeerConnection")}} sở hữu, và trả về một {{jsxref("Promise")}} mà trình xử lý fulfillment sẽ được gọi khi có kết quả.

## Cú pháp

```js-nolint
getStats()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} của JavaScript được thực thi xong khi thống kê sẵn sàng.
Trình xử lý fulfillment của promise nhận một đối tượng {{domxref("RTCStatsReport")}} chứa các thống kê đã thu thập.

Thống kê trả về bao gồm các thông tin từ mọi luồng đi vào qua `RTCRtpReceiver`, cũng như các phụ thuộc của chúng.

Chúng có thể bao gồm, ví dụ, thống kê với [các loại](/en-US/docs/Web/API/RTCStatsReport#the_statistic_types): [`inbound-rtp`](/en-US/docs/Web/API/RTCInboundRtpStreamStats), [`candidate-pair`](/en-US/docs/Web/API/RTCIceCandidatePairStats), [`local-candidate`](/en-US/docs/Web/API/RTCIceCandidateStats), [`remote-candidate`](/en-US/docs/Web/API/RTCIceCandidateStats).

## Ví dụ

Ví dụ đơn giản này lấy thống kê cho một `RTCRtpReceiver` và cập nhật {{domxref("HTMLElement/innerText", "innerText")}} của một phần tử để hiển thị số gói đã mất.

```js
receiver.getStats().then((stats) => {
  document.getElementById("lost-packets").innerText = stats.packetsLost;
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCStatsReport")}}
- {{domxref("RTCRtpSender.getStats()")}}
- {{domxref("RTCPeerConnection.getStats()")}}
