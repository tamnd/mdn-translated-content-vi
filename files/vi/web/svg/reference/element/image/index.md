---
title: <image>
slug: Web/SVG/Reference/Element/image
page-type: svg-element
browser-compat: svg.elements.image
sidebar: svgref
---

Phần tử [SVG](/en-US/docs/Web/SVG) **`<image>`** bao gồm các ảnh bên trong tài liệu SVG. Nó có thể hiển thị các tệp {{glossary("raster image", "ảnh raster")}} hoặc các tệp SVG khác.

Các định dạng ảnh duy nhất mà phần mềm SVG phải hỗ trợ là {{glossary("JPEG")}}, {{glossary("PNG")}} và các tệp SVG khác. Hành vi của {{glossary("GIF")}} động là không xác định.

Các tệp SVG được hiển thị bằng `<image>` được [xử lý như một ảnh](/en-US/docs/Web/SVG/Guides/SVG_as_an_image): tài nguyên bên ngoài không được tải, kiểu {{cssxref(":visited")}} [không được áp dụng](/en-US/docs/Web/CSS/Guides/Selectors/Privacy_and_:visited), và chúng không thể tương tác. Để đưa vào các phần tử SVG động, hãy thử {{SVGElement("use")}} với một URL bên ngoài. Để đưa vào các tệp SVG và chạy script bên trong chúng, hãy thử {{HTMLElement("object")}} bên trong {{SVGElement("foreignObject")}}.

> [!NOTE]
> Tiêu chuẩn HTML định nghĩa `<image>` là một từ đồng nghĩa của {{HTMLElement("img")}} khi phân tích cú pháp HTML. Phần tử cụ thể này và hành vi của nó chỉ áp dụng bên trong tài liệu SVG hoặc SVG nội tuyến.

## Ngữ cảnh sử dụng

{{svginfo}}

## Thuộc tính

- {{SVGAttr("x")}}
  - : Định vị ảnh theo chiều ngang tính từ gốc tọa độ.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("y")}}
  - : Định vị ảnh theo chiều dọc tính từ gốc tọa độ.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `0`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("width")}}
  - : Chiều rộng mà ảnh được hiển thị. Không giống như `<img>` của HTML, thuộc tính này là bắt buộc.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("height")}}
  - : Chiều cao mà ảnh được hiển thị. Không giống như `<img>` của HTML, thuộc tính này là bắt buộc.
    _Kiểu giá trị_: [**\<length>**](/en-US/docs/Web/SVG/Guides/Content_type#length) | [**\<percentage>**](/en-US/docs/Web/SVG/Guides/Content_type#percentage); _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("href")}}
  - : Trỏ tới một URL cho tệp ảnh.
    _Kiểu giá trị_: **[\<URL>](/en-US/docs/Web/SVG/Guides/Content_type#url)**; _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **không**
- {{SVGAttr("preserveAspectRatio")}}
  - : Điều khiển cách ảnh được co giãn.
    _Kiểu giá trị_: (`none` | `xMinYMin` | `xMidYMin` | `xMaxYMin` | `xMinYMid` | `xMidYMid` | `xMaxYMid` | `xMinYMax` | `xMidYMax` | `xMaxYMax`) (`meet` | `slice`)?; _Giá trị mặc định_: `xMidYMid meet`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("crossorigin")}}
  - : Xác định giá trị của cờ thông tin xác thực cho các yêu cầu CORS.
    _Kiểu giá trị_: [ `anonymous` | `use-credentials` ]?; _Giá trị mặc định_: Không có; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("decoding")}}
  - : Cung cấp gợi ý cho trình duyệt về việc nên giải mã ảnh đồng bộ hay bất đồng bộ.
    _Kiểu giá trị_: `async | sync | auto`; _Giá trị mặc định_: `auto`; _Có thể hoạt ảnh_: **có**
- {{SVGAttr("fetchpriority")}} {{experimental_inline}} {{non-standard_inline}}
  - : Cung cấp gợi ý về mức độ ưu tiên tương đối nên dùng khi tìm nạp một ảnh bên ngoài.
    Các giá trị cho phép:
    - `high`
      - : Tìm nạp ảnh bên ngoài với mức ưu tiên cao hơn so với các tài nguyên bên ngoài khác.
    - `low`
      - : Tìm nạp ảnh bên ngoài với mức ưu tiên thấp hơn so với các tài nguyên bên ngoài khác.
    - `auto`
      - : Không đặt ưu tiên cho mức tìm nạp.
        Giá trị này được dùng nếu không đặt giá trị nào hoặc đặt giá trị không hợp lệ.
        Đây là giá trị mặc định.
- {{SVGAttr("xlink:href")}}{{deprecated_inline}}
  - : Trỏ tới một URL cho tệp ảnh.
    _Kiểu giá trị_: **[\<URL>](/en-US/docs/Web/SVG/Guides/Content_type#url)**; _Giá trị mặc định_: _không có_; _Có thể hoạt ảnh_: **không**

## Giao diện DOM

Phần tử này triển khai giao diện {{domxref("SVGImageElement")}}.

## Ví dụ

Hiển thị cơ bản một ảnh PNG trong SVG:

### SVG

```html
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <image href="mdn_logo_only_color.png" height="200" width="200" />
</svg>
```

### Kết quả

{{EmbedLiveSample("Example", 250, 260)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{SVGAttr("fetchpriority")}}
