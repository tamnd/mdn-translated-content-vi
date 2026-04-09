---
title: "Nhãn nhiều phần: dùng ARIA cho nhãn có trường được nhúng bên trong"
short-title: Dùng ARIA cho nhãn có trường nhúng
slug: Web/Accessibility/ARIA/Guides/Multipart_labels
page-type: guide
sidebar: accessibilitysidebar
---

## Vấn đề

Bạn có một biểu mẫu trong đó bạn đặt câu hỏi cho người dùng, nhưng câu trả lời lại được nhắc tới ngay trong chính câu hỏi. Một ví dụ kinh điển mà chúng ta đều biết từ phần cài đặt trình duyệt là tùy chọn "Xóa lịch sử sau x ngày". "Xóa lịch sử sau" nằm bên trái hộp văn bản, x là con số, ví dụ 21, và từ "ngày" nằm sau hộp văn bản, tạo thành một câu dễ hiểu.

Nếu bạn dùng trình đọc màn hình, bạn có để ý rằng khi đi tới tùy chọn này trong Firefox, nó sẽ đọc "Xóa lịch sử sau 21 ngày", sau đó thông báo rằng bạn đang ở trong một hộp văn bản và nó chứa số 21 không? Điều đó khá hay. Bạn không cần phải điều hướng xung quanh để biết đơn vị. "Ngày" hoàn toàn có thể là "tháng" hoặc "năm", và trong nhiều hộp thoại thông thường, không có cách nào biết điều này ngoài việc di chuyển xung quanh bằng các lệnh rà soát màn hình.

Giải pháp nằm ở một thuộc tính ARIA có tên là `aria-labelledby`. Tham số của nó là một chuỗi gồm các ID của những phần tử HTML mà bạn muốn nối lại thành một tên truy cập duy nhất.

Cả `aria-labelledby` và `aria-describedby` đều được khai báo trên phần tử biểu mẫu cần được gắn nhãn, ví dụ một `<input>`. Trong cả hai trường hợp, liên kết giữa nhãn và điều khiển có thể đã tồn tại cũng sẽ bị `aria-labelledby` ghi đè. Nếu trên một trang HTML bạn cung cấp `aria-labelledby`, bạn cũng nên cung cấp cấu trúc label/for để hỗ trợ các trình duyệt cũ chưa có hỗ trợ ARIA. Với Firefox 3, người dùng khiếm thị của bạn sẽ tự động có trợ năng tốt hơn nhờ thuộc tính mới này, nhưng người dùng các trình duyệt cũ cũng không bị bỏ lại phía sau.

### Ví dụ

{{ EmbedLiveSample("Example") }}

```css hidden
body {
  margin: 1rem;
}
```

```html
<input
  aria-labelledby="labelShutdown shutdownTime shutdownUnit"
  type="checkbox" />

<span id="labelShutdown">Shut down computer after</span>

<input
  aria-labelledby="labelShutdown shutdownTime shutdownUnit"
  id="shutdownTime"
  type="text"
  value="10" />

<span id="shutdownUnit"> minutes</span>
```

## Lưu ý cho người dùng JAWS 8

JAWS 8.0 có logic riêng để tìm nhãn, khiến nó luôn ghi đè `accessibleName` mà hộp văn bản trong tài liệu HTML nhận được. Với JAWS 8, tôi chưa tìm ra cách khiến nó chấp nhận nhãn từ ví dụ ở trên. Nhưng NVDA và Window-Eyes xử lý rất tốt, còn Orca trên Linux cũng không gặp vấn đề gì.

> [!NOTE]
> TBD: thêm thông tin tương thích

## Có thể làm điều này mà không cần ARIA không?

Thành viên cộng đồng Ben Millard đã chỉ ra trong một bài viết blog rằng [các điều khiển có thể được nhúng trong nhãn như ví dụ trên bằng HTML 4](https://projectcerbera.com/blog/2008/03/#day24), bằng cách nhúng input vào trong label. Cảm ơn Ben về thông tin này. Nó rất hữu ích và cho thấy một số kỹ thuật đã tồn tại nhiều năm đôi khi vẫn có thể lọt khỏi tầm chú ý của cả những người rất giỏi. Kỹ thuật này hoạt động trong Firefox; tuy nhiên, hiện tại nó không hoạt động trong nhiều trình duyệt khác, bao gồm IE. Với các nhãn có điều khiển biểu mẫu nhúng bên trong, dùng `aria-labelledby` vẫn là cách tiếp cận tốt nhất.
