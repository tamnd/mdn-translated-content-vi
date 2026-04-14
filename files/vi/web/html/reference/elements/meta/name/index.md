---
title: Thuộc tính name của <meta>
short-title: <meta> name
slug: Web/HTML/Reference/Elements/meta/name
page-type: html-attribute
browser-compat: html.elements.meta.name
sidebar: htmlsidebar
---

Thuộc tính **`name`** của phần tử {{htmlelement("meta")}} cung cấp siêu dữ liệu theo cặp tên-giá trị.
Khi một phần tử `<meta>` có thuộc tính `name`, thuộc tính [`content`](/en-US/docs/Web/HTML/Reference/Attributes/content) xác định giá trị tương ứng.
Siêu dữ liệu này là _siêu dữ liệu cấp tài liệu_ áp dụng cho toàn bộ trang.

Ví dụ, thẻ `<meta>` sau đây cung cấp `description` như một siêu dữ liệu cho tài liệu:

```html
<meta
  name="description"
  content="The HTML reference describes all elements and attributes of HTML, including global attributes that apply to all elements." />
```

## Thuộc tính

### Tên meta được định nghĩa trong đặc tả HTML

Đặc tả HTML định nghĩa tập hợp các tên siêu dữ liệu chuẩn sau:

- `application-name`
  - : Trình duyệt có thể sử dụng điều này để xác định ứng dụng đang chạy trong trang web.
    Khác với phần tử {{HTMLElement("title")}}, phần tử này có thể chứa tên ứng dụng (hoặc trang web), nhưng `<title>` có thể thêm thông tin ngữ cảnh như tên tài liệu hoặc trạng thái.
    Các trang riêng lẻ không nên định nghĩa `application-name` riêng, duy nhất của mình.
    Để cung cấp bản dịch, hãy sử dụng nhiều thẻ `<meta>` với thuộc tính `lang` cho mỗi ngôn ngữ:

    ```html
    <meta name="application-name" content="Weather Wizard" lang="en" />
    <meta name="application-name" content="Mago del Clima" lang="es" />
    ```

- `author`
  - : Tên tác giả của tài liệu.
- [`color-scheme`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/color-scheme)
  - : Chỉ định một hoặc nhiều bảng màu mà tài liệu tương thích.
    Trình duyệt sẽ sử dụng thông tin này kết hợp với cài đặt trình duyệt hoặc thiết bị của người dùng để xác định màu sắc sử dụng cho mọi thứ từ nền và nền trước đến các điều khiển biểu mẫu và thanh cuộn.
    Mục đích chính của `<meta name="color-scheme">` là chỉ ra khả năng tương thích và thứ tự ưu tiên cho chế độ màu sáng và tối.
- `description`
  - : Một bản tóm tắt ngắn gọn và chính xác về nội dung của trang, thường được gọi là "mô tả meta".
    Các công cụ tìm kiếm như Google sử dụng siêu dữ liệu này để điều chỉnh [giao diện của trang web trong kết quả tìm kiếm](https://developers.google.com/search/docs/appearance/snippet#meta-descriptions).
- `generator`
  - : Mã định danh của phần mềm tạo ra trang.
- `keywords`
  - : Các từ liên quan đến nội dung của trang, được phân tách bằng dấu phẩy.
- [`referrer`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/referrer)
  - : Kiểm soát HTTP header {{httpheader("Referer")}} của các yêu cầu được gửi từ tài liệu.
- [`theme-color`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/theme-color)
  - : Chỉ ra một màu được đề xuất mà các user agent nên sử dụng để tùy chỉnh hiển thị trang hoặc giao diện người dùng xung quanh.
    Thuộc tính [`content`](/en-US/docs/Web/HTML/Reference/Attributes/content) chứa một giá trị CSS {{cssxref("&lt;color&gt;")}} hợp lệ.
    Thuộc tính [`media`](/en-US/docs/Web/HTML/Reference/Elements/meta#media) với một danh sách media query hợp lệ có thể được bao gồm để đặt phương tiện mà siêu dữ liệu màu chủ đề áp dụng.

### Tên meta được định nghĩa trong các đặc tả khác

Đặc tả CSS Device Adaptation định nghĩa tên siêu dữ liệu sau:

- [`viewport`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/viewport)
  - : Cung cấp gợi ý về kích thước ban đầu của {{glossary("viewport")}}.

### Tên meta được định nghĩa trong WHATWG MetaExtensions wiki

[Trang WHATWG Wiki MetaExtensions](https://wiki.whatwg.org/wiki/MetaExtensions) chứa một tập hợp lớn các tên siêu dữ liệu không chuẩn.
Một số tên được bao gồm được sử dụng khá phổ biến trong thực tế, đặc biệt là các tên sau:

- `creator`
  - : Tên của người tạo ra tài liệu, chẳng hạn như một tổ chức hoặc cơ quan.
    Nếu có nhiều hơn một, nên sử dụng nhiều phần tử {{HTMLElement("meta")}}.
- `googlebot`
  - : Một từ đồng nghĩa của `robots`, chỉ được Googlebot (trình thu thập lập chỉ mục cho Google) tuân theo.
- `publisher`
  - : Tên nhà xuất bản của tài liệu.
- [`robots`](/en-US/docs/Web/HTML/Reference/Elements/meta/name/robots)
  - : Một danh sách phân tách bằng dấu phẩy các giá trị xác định hành vi thu thập dữ liệu mà các trình thu thập dữ liệu hợp tác (hoặc "robots") nên sử dụng với trang.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Siêu dữ liệu: phần tử `<meta>`](/en-US/docs/Learn_web_development/Core/Structuring_content/Webpage_metadata#metadata_the_meta_element)
