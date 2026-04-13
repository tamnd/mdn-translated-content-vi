---
title: CSS Painting API
slug: Web/API/CSS_Painting_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.PaintWorkletGlobalScope
---

{{DefaultAPISidebar("CSS Painting API")}}{{SeeCompatTable}}

CSS Painting API, là một phần của nhóm API [CSS Houdini](/en-US/docs/Web/API/Houdini_APIs), cho phép các nhà phát triển viết các hàm JavaScript có thể vẽ trực tiếp vào nền, viền hoặc nội dung của một phần tử.

## Khái niệm và cách sử dụng

Về cơ bản, CSS Painting API chứa các chức năng cho phép các nhà phát triển tạo ra các giá trị tùy chỉnh cho {{cssxref('image/paint', 'paint()')}}, một hàm CSS {{cssxref('&lt;image&gt;')}}. Bạn có thể áp dụng các giá trị này cho các thuộc tính như {{cssxref('background-image')}} để thiết lập nền tùy chỉnh phức tạp cho một phần tử.

Ví dụ:

```css
aside {
  background-image: paint(my-painted-image);
}
```

API này định nghĩa một {{domxref('worklet')}} có thể được sử dụng để tạo hình ảnh theo chương trình, phản hồi với các thay đổi kiểu được tính toán. Để tìm hiểu thêm về cách sử dụng, hãy xem [Sử dụng CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API/Guide).

## Giao diện

- {{domxref('PaintWorkletGlobalScope')}}
  - : Ngữ cảnh thực thi toàn cục của paint worklet.
- {{domxref('PaintRenderingContext2D')}}
  - : Ngữ cảnh kết xuất của CSS Painting API để vẽ lên bitmap.
- {{domxref('PaintSize')}}
  - : Đại diện kích thước của bitmap đầu ra mà tác giả cần vẽ.

## Ví dụ

Ví dụ dưới đây tạo một danh sách các mục với hình nền xoay vòng giữa ba màu sắc và ba độ rộng khác nhau.
Trong [trình duyệt hỗ trợ](#browser_compatibility), bạn sẽ thấy kết quả giống như hình ảnh dưới đây.

![Độ rộng và màu sắc của hình nền thay đổi dựa trên các thuộc tính tùy chỉnh](Guide/boxbg.png)

Để thực hiện điều này, chúng ta sẽ định nghĩa hai thuộc tính CSS tùy chỉnh là `--box-color` và `--width-subtractor`.

### Paint worklet

Worklet là một tệp JavaScript bên ngoài (trong trường hợp này chúng ta gọi là `boxbg.js`) định nghĩa một paint {{domxref('worklet')}}.
Sử dụng worklet, chúng ta có thể truy cập các thuộc tính CSS (và thuộc tính tùy chỉnh) của các phần tử:

```js
registerPaint(
  "boxbg",
  class {
    static get contextOptions() {
      return { alpha: true };
    }
    /*
      Retrieve any custom properties (or regular properties,
      such as 'height') defined for the element, and return
      them as an array.
    */
    static get inputProperties() {
      return ["--box-color", "--width-subtractor"];
    }

    paint(ctx, size, props) {
      /*
        ctx -> drawing context
        size -> paintSize: width and height
        props -> properties: get() method
      */
      ctx.fillStyle = props.get("--box-color");
      ctx.fillRect(
        0,
        size.height / 3,
        size.width * 0.4 - props.get("--width-subtractor"),
        size.height * 0.6,
      );
    }
  },
);
```

Chúng ta sử dụng phương thức `inputProperties()` trong lớp `registerPaint()` để lấy các giá trị của hai thuộc tính tùy chỉnh được đặt trên phần tử có `boxbg` áp dụng lên đó và sau đó sử dụng chúng trong hàm `paint()`. Phương thức `inputProperties()` có thể trả về tất cả các thuộc tính ảnh hưởng đến phần tử, không chỉ các thuộc tính tùy chỉnh.

### Sử dụng paint worklet

#### HTML

```html live-sample___example-boxbg
<ul>
  <li>item 1</li>
  <li>item 2</li>
  <li>item 3</li>
  <li>item 4</li>
  <li>item 5</li>
  <li>item 6</li>
  <li>item 7</li>
  <li>item 8</li>
  <li>item 9</li>
  <li>item 10</li>
  <li>item N</li>
</ul>
```

#### CSS

Trong CSS, chúng ta định nghĩa các thuộc tính tùy chỉnh `--box-color` và `--width-subtractor`.

```css live-sample___example-boxbg
body {
  font: 1.2em / 1.2 sans-serif;
}
li {
  background-image: paint(boxbg);
  --box-color: hsl(55 90% 60%);
}

li:nth-of-type(3n) {
  --box-color: hsl(155 90% 60%);
  --width-subtractor: 20;
}

li:nth-of-type(3n + 1) {
  --box-color: hsl(255 90% 60%);
  --width-subtractor: 40;
}
```

#### JavaScript

Logic thiết lập của paint worklet nằm trong tệp script bên ngoài.
Để đăng ký worklet, chúng ta cần gọi {{domxref('Worklet.addModule', 'addModule()')}} từ script chính:

```js live-sample___example-boxbg
CSS.paintWorklet.addModule(
  "https://mdn.github.io/houdini-examples/cssPaint/intro/worklets/boxbg.js",
);
```

Trong ví dụ này, worklet được lưu trữ tại `https://mdn.github.io/`, nhưng worklet của bạn có thể là một tài nguyên tương đối như sau:

```js
CSS.paintWorklet.addModule("boxbg.js");
```

#### Kết quả

Mặc dù bạn không thể chỉnh sửa script của worklet, bạn có thể thay đổi các giá trị thuộc tính tùy chỉnh trong DevTools để thay đổi màu sắc và độ rộng của hình nền.

{{EmbedLiveSample("example-boxbg", "", "300px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API/Guide)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
- [Houdini APIs](/en-US/docs/Web/API/Houdini_APIs)
