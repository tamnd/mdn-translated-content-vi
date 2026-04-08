---
title: Privacy and the :visited selector
short-title: Privacy and :visited
slug: Web/CSS/Guides/Selectors/Privacy_and_:visited
page-type: guide
sidebar: cssref
---

Ban đầu, selector [CSS](/en-US/docs/Web/CSS) {{ cssxref(":visited") }} là một rủi ro về quyền riêng tư và bảo mật. Với một đoạn JavaScript nhỏ, các trang web có thể lấy lịch sử duyệt web của người dùng và xác định những trang họ đã truy cập. Điều này được thực hiện thông qua các phương thức như {{domxref("window.getComputedStyle")}} và các kỹ thuật khác. Quá trình này diễn ra rất nhanh, cho phép các trang web không chỉ xác định được người dùng đã ghé thăm đâu trên web, mà còn suy đoán nhiều thông tin về danh tính của người dùng.

Để giảm thiểu lo ngại về quyền riêng tư này, trình duyệt giới hạn lượng thông tin có thể thu thập từ các liên kết đã truy cập.

## Những lời nói dối vô hại

Để bảo vệ quyền riêng tư của người dùng, trình duyệt nói dối các ứng dụng web trong một số trường hợp nhất định:

- Phương thức `window.getComputedStyle` và các hàm tương tự như {{ domxref("element.querySelector") }} luôn trả về giá trị cho thấy người dùng chưa truy cập bất kỳ liên kết nào trên trang.
- Khi sử dụng sibling selector, chẳng hạn `:visited + span`, phần tử liền kề (`span` trong ví dụ này) được tạo kiểu như thể liên kết chưa được truy cập.
- Trong một số trường hợp hiếm gặp, nếu bạn sử dụng các phần tử liên kết lồng nhau và phần tử đang được khớp khác với liên kết đang được kiểm tra trong lịch sử, phần tử đó sẽ được hiển thị như thể liên kết chưa được truy cập.

## Giới hạn kiểu dáng của liên kết đã truy cập

Bạn có thể tạo kiểu cho các liên kết đã truy cập, nhưng có giới hạn về những kiểu nào bạn có thể sử dụng. Chỉ những kiểu sau đây có thể được áp dụng cho các liên kết đã truy cập:

- {{ cssxref("color") }}
- {{ cssxref("background-color") }}
- {{ cssxref("border-color") }} (và các sub-property của nó)
- {{ cssxref("column-rule-color") }}
- {{ cssxref("outline-color") }}
- {{ cssxref("text-decoration-color") }}
- {{ cssxref("text-emphasis-color") }}
- Phần màu sắc của các thuộc tính {{SVGAttr("fill")}} và {{SVGAttr("stroke")}}

Ngoài ra, ngay cả với các kiểu đã đề cập ở trên, sự khác biệt về độ trong suốt giữa liên kết chưa truy cập và đã truy cập cũng không được áp dụng. Hạn chế này ngăn việc sử dụng tham số `alpha` trong các hàm {{cssxref("color_value", "&lt;color&gt;")}} khác nhau hoặc từ khóa [`transparent`](/en-US/docs/Web/CSS/Reference/Values/named-color#transparent) để phân biệt hai trạng thái.

Dưới đây là ví dụ về cách sử dụng các kiểu với các hạn chế đã đề cập:

```css
:link {
  outline: 1px dotted blue;
  background-color: white;
  /* The default value of `background-color` is `transparent`. You need to
     specify a different value, otherwise changes on `:visited` won't apply. */
}

:visited {
  outline-color: orange; /* Visited links have an orange outline */
  background-color: green; /* Visited links have a green background */
  color: yellow; /* Visited links have yellow colored text */
}
```

## Ảnh hưởng đến nhà phát triển web

Bạn có thể muốn cân nhắc những điều sau khi phát triển trang web:

- Thay đổi giá trị {{cssxref("background-image")}} dựa trên trạng thái đã truy cập của liên kết sẽ không hoạt động vì chỉ có màu sắc mới có thể được dùng để tạo kiểu cho liên kết đã truy cập.
- Các màu sắc vốn trong suốt sẽ không được áp dụng khi tạo kiểu thông qua selector `:visited`.

## Xem thêm

- [Preventing attacks on a user's history through CSS `:visited` selectors](https://dbaron.org/mozilla/visited-privacy) (2010)
