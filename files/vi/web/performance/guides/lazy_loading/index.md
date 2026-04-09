---
title: Tải lười
slug: Web/Performance/Guides/Lazy_loading
page-type: guide
spec-urls: https://html.spec.whatwg.org/multipage/#lazy-loading-attributes
sidebar: performancesidebar
---

**Tải lười** là một chiến lược để xác định các tài nguyên là không chặn (không quan trọng) và chỉ tải chúng khi cần. Đây là một cách để rút ngắn độ dài của [critical rendering path](/en-US/docs/Web/Performance/Guides/Critical_rendering_path), từ đó giảm thời gian tải trang.

Tải lười có thể diễn ra vào nhiều thời điểm khác nhau trong ứng dụng, nhưng thường xảy ra khi có một số tương tác của người dùng như cuộn trang và điều hướng.

## Tổng quan

Khi web phát triển, chúng ta đã thấy số lượng và kích thước tài nguyên gửi đến người dùng tăng lên rất mạnh.
Từ năm 2011 đến 2019, trọng lượng tài nguyên trung vị tăng từ **\~100KB** lên **\~400KB** trên máy tính để bàn và từ **\~50KB** lên **\~350KB** trên thiết bị di động. Trong khi đó, kích thước hình ảnh tăng từ **\~250KB** lên **\~900KB** trên máy tính để bàn và từ **\~100KB** lên **\~850KB** trên thiết bị di động.

Một trong những phương pháp chúng ta có thể dùng để giải quyết vấn đề này là rút ngắn độ dài [Critical Rendering Path](/en-US/docs/Web/Performance/Guides/Critical_rendering_path) bằng cách tải lười các tài nguyên không quan trọng cho lần hiển thị đầu tiên.
Một ví dụ thực tế là khi bạn vào trang chủ của một trang thương mại điện tử có liên kết đến trang/phần giỏ hàng, và không có tài nguyên nào của trang giỏ hàng (chẳng hạn JavaScript, CSS và hình ảnh) được tải xuống **cho đến khi** bạn điều hướng tới đó.

## Chiến lược

Tải lười có thể được áp dụng cho nhiều tài nguyên khác nhau và thông qua nhiều chiến lược.

### Chung

#### Chia nhỏ mã

JavaScript, CSS và HTML có thể được chia thành các đoạn nhỏ hơn. Điều này cho phép gửi trước mã tối thiểu cần thiết để cung cấp giá trị, cải thiện thời gian tải trang. Phần còn lại có thể được tải theo nhu cầu.

- Chia theo điểm vào: tách mã theo các điểm vào trong ứng dụng
- Chia động: tách mã ở nơi dùng biểu thức [dynamic import()](/en-US/docs/Web/JavaScript/Reference/Operators/import)

### JavaScript

#### Script type module

Bất kỳ thẻ script nào có `type="module"` đều được xem là một [mô-đun JavaScript](/en-US/docs/Web/JavaScript/Guide/Modules) và mặc định sẽ bị hoãn.

### CSS

Theo mặc định, CSS được xem là một tài nguyên [render blocking](/en-US/docs/Web/Performance/Guides/Critical_rendering_path), vì vậy trình duyệt sẽ không hiển thị bất kỳ nội dung đã xử lý nào cho đến khi [CSSOM](/en-US/docs/Web/API/CSS_Object_Model) được xây dựng. CSS phải gọn, được truyền đến nhanh nhất có thể, và nên dùng các kiểu media cũng như truy vấn media để gỡ chặn việc hiển thị.

```html
<link href="style.css" rel="stylesheet" media="all" />
<link href="portrait.css" rel="stylesheet" media="(orientation:portrait)" />
<link href="print.css" rel="stylesheet" media="print" />
```

Có thể thực hiện một số [tối ưu hóa CSS](/en-US/docs/Learn_web_development/Extensions/Performance/CSS) để đạt được điều đó.

### Phông chữ

Theo mặc định, các yêu cầu phông chữ bị trì hoãn cho đến khi cây hiển thị được xây dựng, điều này có thể khiến việc hiển thị văn bản bị chậm.

Có thể ghi đè hành vi mặc định và tải trước tài nguyên web font bằng `<link rel="preload">`, [bộ mô tả `font-display` của CSS](/en-US/docs/Web/CSS/Reference/At-rules/@font-face/font-display), và [Font Loading API](/en-US/docs/Web/API/CSS_Font_Loading_API).

Xem thêm: [Element Link](/en-US/docs/Web/HTML/Reference/Elements/link).

### Hình ảnh, iframe, video và âm thanh

Rất thường xuyên, các trang web chứa nhiều hình ảnh góp phần vào mức sử dụng dữ liệu và tốc độ tải trang. Phần lớn các hình ảnh đó nằm ngoài màn hình ([non-critical](/en-US/docs/Web/Performance/Guides/Critical_rendering_path)), nên cần một tương tác của người dùng, như cuộn trang, để xem chúng. Tương tự, nhiều iframe, video và âm thanh ban đầu cũng có thể nằm ngoài vùng hiển thị.

#### Thuộc tính loading

Thuộc tính [`loading`](/en-US/docs/Web/HTML/Reference/Elements/img#loading) trên phần tử {{HTMLElement("img")}}, {{HTMLElement("iframe")}}, {{HTMLElement("video")}}, hoặc {{HTMLElement("audio")}} có thể được dùng để chỉ dẫn trình duyệt trì hoãn việc tải các tài nguyên được liên kết khi các phần tử nằm ngoài màn hình cho đến khi người dùng cuộn đến gần chúng.
Điều này cho phép các tài nguyên không quan trọng chỉ tải khi cần, có thể giúp tăng tốc các lượt tải trang ban đầu và giảm mức sử dụng mạng.

```html
<img loading="lazy" src="image.jpg" alt="..." />
<iframe loading="lazy" src="video-player.html" title="..."></iframe>
```

Sự kiện `load` được kích hoạt khi nội dung được tải ngay lập tức đã tải xong. Vào thời điểm đó, hoàn toàn có thể xảy ra, hoặc thậm chí rất có thể, rằng vẫn còn các hình ảnh, iframe, video hoặc âm thanh được tải lười trong {{Glossary("visual viewport")}} chưa được tải xong.

Bạn có thể xác định một hình ảnh đã tải xong hay chưa bằng cách kiểm tra giá trị của thuộc tính boolean {{domxref("HTMLImageElement.complete", "complete")}} của nó.

#### Intersection Observer API

[Intersection Observers](/en-US/docs/Web/API/IntersectionObserver) cho phép người dùng biết khi một phần tử được quan sát đi vào hoặc ra khỏi vùng hiển thị của trình duyệt.

#### Trình xử lý sự kiện

Khi khả năng tương thích trình duyệt là quan trọng, có một vài lựa chọn:

- [polyfill intersection observer](https://github.com/w3c/IntersectionObserver)
- dự phòng sang các trình xử lý sự kiện scroll, resize hoặc orientation change để xác định xem một phần tử cụ thể có nằm trong viewport hay không

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [CSS chặn hiển thị](https://web.dev/articles/critical-rendering-path/render-blocking-css)
- [Tải lười hình ảnh ở cấp trình duyệt cho web](https://web.dev/articles/browser-level-image-lazy-loading)
- [Đã đến lúc tải lười các iframe ngoài màn hình!](https://web.dev/articles/iframe-lazy-loading)
