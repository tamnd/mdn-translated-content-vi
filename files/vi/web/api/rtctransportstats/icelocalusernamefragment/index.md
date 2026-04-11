---
title: "RTCTransportStats: thuộc tính iceLocalUsernameFragment"
short-title: iceLocalUsernameFragment
slug: Web/API/RTCTransportStats/iceLocalUsernameFragment
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.RTCStatsReport.type_transport.iceLocalUsernameFragment
---

{{APIRef("WebRTC")}}{{SeeCompatTable}}

Thuộc tính **`iceLocalUsernameFragment`** của từ điển {{domxref("RTCTransportStats")}} là một chuỗi chỉ ra username fragment cục bộ ("ufrag" hoặc "ice-ufrag") xác định duy nhất phiên tương tác ICE được quản lý bởi transport này.

Username fragment giống nhau được dùng để xác định phiên cho bất kỳ giao tiếp nào với máy chủ STUN.

Nó có cùng giá trị với thuộc tính {{domxref("RTCIceCandidate.usernameFragment")}} cục bộ tương ứng.
Nó sẽ thay đổi nếu kết nối được đàm phán lại, ví dụ khi ICE restart, hoặc nếu {{domxref("RTCPeerConnection.setLocalDescription()")}} được gọi.

## Giá trị

Một chuỗi chứa username fragment xác định duy nhất phiên ICE đang diễn ra trên transport.

Chuỗi có thể dài tối đa 256 ký tự và không có giá trị mặc định.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
