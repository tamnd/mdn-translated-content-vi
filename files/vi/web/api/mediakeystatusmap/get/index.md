---
title: "MediaKeyStatusMap: phương thức get()"
short-title: get()
slug: Web/API/MediaKeyStatusMap/get
page-type: web-api-instance-method
browser-compat: api.MediaKeyStatusMap.get
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Phương thức **`get()`** của giao diện {{domxref("MediaKeyStatusMap")}} trả về giá trị trạng thái liên kết với khóa đã cho, hoặc `undefined` nếu không có.

Giá trị trạng thái cho biết liệu khóa cụ thể có thể được sử dụng để giải mã hay không.

## Cú pháp

```js-nolint
get(key)
```

### Tham số

- `key`
  - : Khóa có giá trị bạn muốn trả về.

### Giá trị trả về

Một chuỗi chỉ định giá trị trạng thái liên kết với khóa đã cho, hoặc `undefined`.

Các giá trị trạng thái sau được phép:

- `usable`
  - : Khóa hiện đang có thể sử dụng để giải mã.
- `expired`
  - : Khóa không còn có thể sử dụng để giải mã vì thời gian hết hạn của nó đã qua.
- `released`
  - : Khóa đã được giải phóng và không còn khả dụng cho CDM. Tuy nhiên, thông tin về khóa vẫn còn, chẳng hạn như hồ sơ hủy giấy phép.
- `output-restricted`
  - : Có các hạn chế đầu ra liên kết với khóa dựa trên chính sách được chỉ định. Dữ liệu phương tiện được giải mã bằng khóa này có thể bị chặn hiển thị. Trạng thái cho biết kết nối giữa nguồn và đầu ra (ví dụ: máy tính và màn hình ngoài của bạn) không đáng tin cậy. Điều này có thể cho biết có sự không khớp phiên bản HDCP giữa nguồn, các thiết bị trung gian và đầu ra, hoặc các thiết bị kết nối trung gian như cáp HDMI hoặc bộ chia video bị hỏng hoặc không tuân thủ.
- `output-downscaled`
  - : Có các hạn chế đầu ra liên kết với khóa dựa trên chính sách được chỉ định, nhưng các hạn chế này có thể được nới lỏng nếu nội dung được phát ở chất lượng thấp hơn. Nếu giá trị này được trả về, ứng dụng có thể phát nội dung ở độ phân giải thấp hơn.
- `usable-in-future`
  - : Khóa sẽ trở nên có thể sử dụng để giải mã trong tương lai, khi đến thời gian bắt đầu của nó.
- `status-pending`
  - : Trạng thái của khóa chưa được biết và đang được xác định.
- `internal-error`
  - : Khóa hiện không thể sử dụng để giải mã do lỗi trong CDM. Ứng dụng không thể làm gì để xử lý trường hợp này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
