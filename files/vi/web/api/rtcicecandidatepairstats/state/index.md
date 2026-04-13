---
title: "RTCIceCandidatePairStats: state property"
short-title: state
slug: Web/API/RTCIceCandidatePairStats/state
page-type: web-api-instance-property
browser-compat: api.RTCStatsReport.type_candidate-pair.state
---

{{APIRef("WebRTC")}}

Thuộc tính **`state`** của từ điển {{domxref("RTCIceCandidatePairStats")}} cho biết trạng thái của [danh sách kiểm tra](#danh_sach_kiem_tra_ice) mà cặp ứng viên là thành viên.

## Giá trị

Một chuỗi có giá trị là một trong các giá trị sau:

- `failed`
  - : Đã thực hiện kiểm tra cho cặp này nhưng thất bại. Lỗi có thể xảy ra do không nhận được phản hồi hoặc phản hồi cho biết đã xảy ra lỗi không thể phục hồi.
- `frozen`
  - : Chưa có kiểm tra nào được thực hiện cho cặp ứng viên này, và việc thực hiện kiểm tra bị chặn cho đến khi một kiểm tra khác thành công. Khi kiểm tra đó thành công, cặp này sẽ được giải phóng và chuyển sang trạng thái `waiting`.
- `in-progress`
  - : Đã bắt đầu một kiểm tra cho cặp này, nhưng giao dịch của kiểm tra vẫn đang tiến hành.
- `succeeded`
  - : Đã hoàn thành thành công kiểm tra cho cặp này.
- `waiting`
  - : Cặp này chưa được kiểm tra, nhưng kiểm tra có thể được thực hiện ngay khi cặp này là cặp có mức ưu tiên cao nhất còn lại ở trạng thái `waiting`.

## Mô tả

### Danh sách kiểm tra ICE

Trong quá trình đàm phán ICE, lớp ICE xây dựng một _danh sách kiểm tra_, là danh sách các cặp ứng viên ICE tiềm năng. Mỗi cặp có một trạng thái, được biểu diễn bằng một chuỗi ký tự.

![Sơ đồ cho thấy trạng thái của các cặp ứng viên ICE thay đổi khi danh sách kiểm tra được phân tích](ice-check-list-states.svg)

Khi một cặp ứng viên được thêm vào danh sách kiểm tra, nó bắt đầu ở trạng thái `frozen`. Ngay khi không có kiểm tra nào đang diễn ra có thể chặn cặp đó được phân tích, nó được giải phóng và chuyển sang trạng thái `waiting`. Điều này có thể xảy ra ngay lập tức khi được thêm vào danh sách kiểm tra.

Mỗi khi một cặp ứng viên được kiểm tra, cặp ứng viên có mức ưu tiên cao nhất tiếp theo còn lại trong danh sách kiểm tra chuyển từ trạng thái `waiting` sang trạng thái `in-progress`, và kiểm tra của nó bắt đầu. Nếu kiểm tra thất bại vì bất kỳ lý do gì, cặp đó chuyển sang trạng thái cuối cùng là `failed`. Nếu kiểm tra thành công, cặp kết thúc ở trạng thái `succeeded`. Trạng thái danh sách kiểm tra ICE cho bất kỳ cặp ứng viên ICE nào có thể được tìm thấy trong thuộc tính `state` tương ứng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
