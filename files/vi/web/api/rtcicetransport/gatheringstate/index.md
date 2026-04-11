---
title: "RTCIceTransport: thuộc tính gatheringState"
short-title: gatheringState
slug: Web/API/RTCIceTransport/gatheringState
page-type: web-api-instance-property
browser-compat: api.RTCIceTransport.gatheringState
---

{{APIRef("WebRTC")}}

Thuộc tính chỉ đọc **`gatheringState`** của giao diện {{domxref("RTCIceTransport")}} trả về một chuỗi cho biết trạng thái thu thập hiện tại của tác nhân ICE cho truyền tải này: `"new"`, `"gathering"`, hoặc `"complete"`.

Bạn có thể phát hiện khi giá trị của thuộc tính này thay đổi bằng cách theo dõi sự kiện kiểu {{domxref("RTCIceTransport/gatheringstatechange_event", "gatheringstatechange")}}.

Lưu ý rằng **`gatheringState`** đại diện cho trạng thái thu thập của riêng truyền tải này, trong khi {{domxref("RTCPeerConnection.iceGatheringState")}} đại diện cho trạng thái thu thập tổng thể của toàn bộ kết nối, bao gồm mọi {{domxref("RTCIceTransport")}} được sử dụng bởi mọi {{domxref("RTCRtpSender")}} và mọi {{domxref("RTCRtpReceiver")}} trên toàn bộ kết nối.

## Giá trị

Một chuỗi cho biết trạng thái hiện tại của quá trình thu thập ứng cử viên của tác nhân ICE:

- `"new"`
  - : {{domxref("RTCIceTransport")}} vừa được tạo và chưa bắt đầu thu thập ứng cử viên ICE.
- `"gathering"`
  - : Truyền tải đang trong quá trình thu thập ứng cử viên.
- `"complete"`
  - : Truyền tải đã hoàn thành việc thu thập ứng cử viên ICE và đã gửi chỉ báo kết thúc ứng cử viên đến thiết bị từ xa. Truyền tải sẽ không thu thập thêm ứng cử viên nào nữa trừ khi xảy ra [khởi động lại ICE](/en-US/docs/Web/API/WebRTC_API/Session_lifetime#ice_restart), lúc đó quá trình thu thập bắt đầu lại từ đầu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
