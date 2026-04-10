---
title: "XRSession: thuộc tính visibilityState"
short-title: visibilityState
slug: Web/API/XRSession/visibilityState
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRSession.visibilityState
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`visibilityState`** của giao diện {{DOMxRef("XRSession")}} là một chuỗi cho biết nội dung WebXR có hiện đang hiển thị cho người dùng hay không và nếu có, liệu nó có phải là trọng tâm chính hay không.

Mỗi khi trạng thái hiển thị thay đổi, một sự kiện {{DOMxRef("XRSession.visibilitychange_event","visibilitychange")}} được gửi trên đối tượng {{DOMxRef("XRSession")}}.

## Giá trị

Một chuỗi cho biết nội dung XR có hiển thị cho người dùng hay không và nếu có, liệu nó có hiện là trọng tâm chính hay không.

Các giá trị có thể của `visibilityState` là:

- `hidden`
  - : Cảnh ảo được tạo bởi {{domxref("XRSession")}} hiện không hiển thị cho người dùng, vì vậy các callback {{domxref("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} của nó _không_ được thực thi cho đến khi `visibilityState` thay đổi. Các bộ điều khiển đầu vào _không_ được xử lý cho phiên.
- `visible`
  - : Cảnh ảo được kết xuất bởi {{domxref("XRSession")}} hiện đang hiển thị cho người dùng và là trọng tâm chính của sự chú ý người dùng. Do đó, các callback {{domxref("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} của phiên đang được thực thi ở tốc độ làm mới gốc của thiết bị XR và các bộ điều khiển đầu vào đang được xử lý bình thường.
- `visible-blurred`
  - : Mặc dù cảnh ảo được kết xuất bởi {{domxref("XRSession")}} có thể hiện đang hiển thị cho người dùng, nhưng nó không phải là trọng tâm chính của người dùng vào lúc này; cũng có thể phiên hiện không hiển thị. Để tối ưu hóa việc sử dụng tài nguyên, {{Glossary("user agent")}} có thể đang xử lý các callback {{domxref("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} của phiên ở tốc độ bị giới hạn. Các bộ điều khiển đầu vào _không_ được xử lý cho phiên.

## Ghi chú sử dụng

Điều quan trọng cần lưu ý là vì một phiên WebXR nhập vai có khả năng được hiển thị bằng màn hình khác với tài liệu HTML mà nó đang chạy (chẳng hạn như khi được hiển thị trên kính thực tế ảo), giá trị của `visibilityState` của phiên không nhất thiết phải giống với {{domxref("Document.visibilityState", "visibilityState")}} của _{{domxref("document")}}_ sở hữu. Ví dụ: nếu người xem đang sử dụng kính thực tế ảo được nối với máy tính và cảnh nhập vai bị che khuất bởi giao diện cấu hình, người dùng có thể nhìn ra phía sau kính và vẫn có thể thấy tài liệu trên màn hình máy tính của họ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{DOMxRef("XRSession.visibilitychange_event","visibilitychange")}}
