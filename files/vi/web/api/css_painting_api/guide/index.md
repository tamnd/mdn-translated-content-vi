---
title: Sử dụng CSS Painting API
slug: Web/API/CSS_Painting_API/Guide
page-type: guide
---

{{DefaultAPISidebar("CSS Painting API")}}

[CSS Paint API](/en-US/docs/Web/API/CSS_Painting_API) được thiết kế để cho phép các nhà phát triển định nghĩa các hình ảnh theo chương trình, sau đó có thể được sử dụng ở bất kỳ đâu mà CSS có thể dùng hình ảnh, chẳng hạn như CSS {{cssxref("background-image")}}, {{cssxref("border-image")}}, {{cssxref("mask-image")}}, v.v.

Để tạo một hình ảnh theo chương trình dùng trong stylesheet CSS, chúng ta cần thực hiện một số bước:

1. Định nghĩa một paint worklet sử dụng hàm {{domxref('PaintWorkletGlobalScope.registerPaint', 'registerPaint()')}}
2. Đăng ký worklet
3. Thêm hàm CSS {{cssxref('image/paint', 'paint()')}}

Để giải thích rõ hơn các bước này, chúng ta sẽ bắt đầu bằng cách tạo nền tô sáng một nửa, giống như trong tiêu đề này:

![Văn bản 'My Cool Header' với một khối hình ảnh nền vàng đặc ở phía dưới bên trái hai phần ba tiêu đề](mycoolheader.png)

> [!NOTE]
> Xem [CSS Painting API Example](https://mdn.github.io/dom-examples/css-painting/) để có bản demo đầy đủ cùng với [mã nguồn](https://github.com/mdn/dom-examples/tree/main/css-painting).

## CSS paint worklet

Trong một tệp script bên ngoài, chúng ta sử dụng hàm {{domxref('PaintWorkletGlobalScope.registerPaint', 'registerPaint()')}} để đặt tên cho [CSS Paint worklet](/en-US/docs/Web/API/Worklet). Hàm này nhận hai tham số. Tham số đầu tiên là tên chúng ta đặt cho worklet, đây là tên chúng ta sẽ sử dụng trong CSS làm tham số của hàm `paint()` khi muốn áp dụng kiểu dáng này cho một phần tử. Tham số thứ hai là lớp thực hiện toàn bộ phép màu, định nghĩa các tùy chọn ngữ cảnh và những gì cần vẽ trên canvas hai chiều sẽ là hình ảnh của chúng ta.

```js
registerPaint(
  "header-highlight",
  class {
    /*
     * define if alpha transparency is allowed alpha
     * is set to true by default. If set to false, all
     * colors used on the canvas will be fully opaque
     */
    static get contextOptions() {
      return { alpha: true };
    }

    /*
     * ctx is the 2D drawing context
     * a subset of the HTML Canvas API.
     */
    paint(ctx) {
      ctx.fillStyle = "hsl(55 90% 60% / 100%)";
      ctx.fillRect(0, 15, 200, 20); /* order: x, y, w, h */
    }
  },
);
```

Trong ví dụ lớp này, chúng ta đã định nghĩa một tùy chọn ngữ cảnh duy nhất với hàm `contextOptions()`: chúng ta trả về một đối tượng cho biết tính trong suốt alpha được cho phép.

Sau đó chúng ta sử dụng hàm `paint()` để vẽ lên canvas.

Một hàm `paint()` có thể nhận ba đối số. Ở đây chúng ta đã cung cấp một đối số: ngữ cảnh kết xuất (chúng ta sẽ xem thêm sau), thường được gọi bằng tên biến `ctx`. Ngữ cảnh Kết xuất 2D là một tập con của [HTML Canvas API](/en-US/docs/Web/API/Canvas_API); phiên bản có sẵn cho Houdini (được gọi là `PaintRenderingContext2D`) là một tập con nữa chứa hầu hết các tính năng có sẵn trong Canvas API đầy đủ với [ngoại lệ](https://drafts.css-houdini.org/css-paint-api-1/#2d-rendering-context) là các API `CanvasImageData`, `CanvasUserInterface`, `CanvasText` và `CanvasTextDrawingStyles`.

Chúng ta định nghĩa {{domxref('CanvasRenderingContext2D.fillStyle', 'fillStyle')}} là `hsl(55 90% 60% / 100%)`, là một màu vàng, sau đó gọi `fillRect()` để tạo một hình chữ nhật màu đó. Các tham số của {{domxref('CanvasRenderingContext2D.fillRect', 'fillRect()')}} theo thứ tự là: gốc trục x, gốc trục y, chiều rộng và chiều cao. `fillRect(0, 15, 200, 20)` tạo ra một hình chữ nhật rộng 200 đơn vị và cao 20 đơn vị, đặt cách trái 0 đơn vị và cách trên 15 đơn vị so với hộp nội dung.

Chúng ta có thể sử dụng các thuộc tính CSS {{cssxref("background-size")}} và {{cssxref("background-position")}} để thay đổi kích thước hoặc vị trí của hình nền này, nhưng đây là kích thước và vị trí mặc định của hộp vàng chúng ta đã tạo trong paint worklet.

Chúng ta cố gắng giữ ví dụ đơn giản. Để có thêm tùy chọn, hãy xem tài liệu {{HTMLElement("canvas")}}. Chúng ta cũng thêm một chút phức tạp hơn sau trong hướng dẫn này.

## Đăng ký worklet

Để sử dụng paint worklet, chúng ta cần đăng ký nó bằng {{domxref('Worklet.addModule', 'addModule()')}} và thêm vào CSS, đảm bảo bộ chọn CSS khớp với một nút DOM trong HTML của chúng ta.

Việc thiết lập và thiết kế paint worklet của chúng ta đã diễn ra trong tệp script bên ngoài như trên. Chúng ta cần đăng ký {{domxref('worklet')}} đó từ script chính.

```js
CSS.paintWorklet.addModule("nameOfPaintWorkletFile.js");
```

Điều này có thể được thực hiện bằng phương thức `addModule()` của paint worklet trong một `<script>` trong HTML chính hoặc trong một tệp JavaScript bên ngoài được liên kết từ tài liệu.

## Sử dụng paint worklet

Trong ví dụ của chúng ta, paintworklet được lưu trữ cùng với tệp script chính. Để sử dụng nó, trước tiên chúng ta đăng ký nó:

```js
CSS.paintWorklet.addModule("header-highlight.js");
```

### Tham chiếu paint worklet trong CSS

Khi đã có một paint worklet đã đăng ký, chúng ta có thể sử dụng nó trong CSS. Sử dụng hàm CSS `paint()` giống như chúng ta sử dụng bất kỳ loại `<image>` nào khác, sử dụng cùng một chuỗi định danh mà chúng ta đã dùng trong hàm `registerPaint()` của paintworklet.

```css
.fancy {
  background-image: paint(header-highlight);
}
```

### Kết hợp lại

Sau đó chúng ta có thể thêm lớp fancy vào bất kỳ phần tử nào trên trang để thêm hộp vàng làm nền:

```html
<h1 class="fancy">My Cool Header</h1>
```

Ví dụ sau sẽ trông giống như hình ảnh trên trong [các trình duyệt hỗ trợ CSS Painting API](/en-US/docs/Web/API/CSS/paintWorklet_static#browser_compatibility).

{{EmbedGHLiveSample("dom-examples/css-painting/half-highlight-fixed-size/", 120, 120)}}

Mặc dù bạn không thể thay đổi script của worklet, bạn có thể thay đổi `background-size` và `background-position` để thay đổi kích thước và vị trí của hình nền.

## PaintSize

Trong ví dụ trên, chúng ta đã tạo một hộp 20x200 đơn vị, được vẽ cách trên 15 đơn vị so với phần tử, nó giống nhau bất kể kích thước của phần tử. Nếu văn bản nhỏ, hộp vàng trông như một đường gạch dưới khổng lồ. Nếu văn bản lớn, hộp có thể trông như một thanh phía trên ba chữ cái đầu tiên. Sẽ tốt hơn nếu hình nền có kích thước tương đối so với kích thước của phần tử, chúng ta có thể sử dụng thuộc tính `paintSize` của phần tử để đảm bảo hình nền tỷ lệ thuận với kích thước hộp mô hình của phần tử.

![Nền chiếm 50% chiều cao và 60% chiều rộng của phần tử](mycoolheadersized.png)

Trong hình trên, nền tỷ lệ thuận với kích thước của phần tử. Ví dụ thứ 3 có `width: 50%;` được đặt trên phần tử cấp khối, làm cho phần tử hẹp hơn và do đó hình nền cũng hẹp hơn.

### Paint worklet

Mã để làm điều này trông như sau:

```js
registerPaint(
  "header-highlight",
  class {
    static get contextOptions() {
      return { alpha: true };
    }

    /*
     * ctx is the 2D drawing context
     * size is the paintSize, the dimensions (height and width) of the box being painted
     */
    paint(ctx, size) {
      ctx.fillStyle = "hsl(55 90% 60% / 100%)";
      ctx.fillRect(0, size.height / 3, size.width * 0.4, size.height * 0.6);
    }
  },
);
```

Ví dụ mã này có hai điểm khác biệt so với ví dụ đầu tiên:

1. Chúng ta đã thêm một đối số thứ hai là kích thước vẽ.
2. Chúng ta đã thay đổi kích thước và vị trí của hình chữ nhật để tương đối với kích thước hộp phần tử thay vì các giá trị tuyệt đối.

Chúng ta có thể truyền tham số thứ hai vào hàm `paint()` để truy cập chiều rộng và chiều cao của phần tử, thông qua các thuộc tính `.width` và `.height`.

Tiêu đề của chúng ta bây giờ có phần tô sáng thay đổi theo kích thước của nó.

### Sử dụng paint worklet

#### HTML

```html
<h1 class="fancy">Largest Header</h1>
<h6 class="fancy">Smallest Header</h6>
<h3 class="fancy half">50% width header</h3>
```

#### CSS

Mặc dù bạn không thể thay đổi script của worklet, bạn có thể thay đổi `font-size` và `width` của phần tử để thay đổi kích thước của hình nền.

```css
.fancy {
  background-image: paint(header-highlight);
}
.half {
  width: 50%;
}
```

#### JavaScript

```js
CSS.paintWorklet.addModule("header-highlight.js");
```

#### Kết quả

Trong [các trình duyệt hỗ trợ CSS Paint API](/en-US/docs/Web/API/CSS/paintWorklet_static#browser_compatibility), các phần tử trong ví dụ dưới đây sẽ có nền vàng tỷ lệ với kích thước phông chữ của chúng.

{{EmbedGHLiveSample("dom-examples/css-painting/half-highlight-paintsize", 200, 200)}}

## Thuộc tính tùy chỉnh

Ngoài việc truy cập kích thước của phần tử, worklet cũng có thể truy cập các thuộc tính CSS tùy chỉnh và các thuộc tính CSS thông thường.

```js
registerPaint(
  "cssPaintFunctionName",
  class {
    static get inputProperties() {
      return ["PropertyName1", "--customPropertyName2"];
    }
    static get inputArguments() {
      return ["<color>"];
    }
    static get contextOptions() {
      return { alpha: true };
    }

    paint(drawingContext, elementSize, styleMap) {
      // Paint code goes here.
    }
  },
);
```

Ba tham số của hàm `paint()` bao gồm ngữ cảnh vẽ, kích thước vẽ và các thuộc tính. Để có thể truy cập các thuộc tính, chúng ta thêm phương thức tĩnh `inputProperties()`, cung cấp quyền truy cập trực tiếp vào các thuộc tính CSS, bao gồm cả các thuộc tính thông thường và [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Guides/Cascading_variables), và trả về một {{jsxref("Array", "mảng", "", 1)}} tên thuộc tính. Chúng ta sẽ xem xét [`inputArguments`](#passing_parameters) trong phần cuối.

Hãy tạo một danh sách các mục với hình nền xoay vòng giữa ba màu sắc và ba độ rộng khác nhau.

![Độ rộng và màu sắc của hình nền thay đổi dựa trên các thuộc tính tùy chỉnh](boxbg.png)

Để thực hiện điều này, chúng ta sẽ định nghĩa hai thuộc tính CSS tùy chỉnh là `--box-color` và `--width-subtractor`.

### Paint worklet

Trong worklet, chúng ta có thể tham chiếu đến các thuộc tính tùy chỉnh này.

```js
registerPaint(
  "boxbg",
  class {
    static get contextOptions() {
      return { alpha: true };
    }

    /*
     * use this function to retrieve any custom properties (or regular properties, such as 'height')
     * defined for the element, return them in the specified array
     */
    static get inputProperties() {
      return ["--box-color", "--width-subtractor"];
    }

    paint(ctx, size, props) {
      /*
       * ctx -> drawing context
       * size -> paintSize: width and height
       * props -> properties: get() method
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

Chúng ta sử dụng phương thức `inputProperties()` trong lớp `registerPaint()` để lấy giá trị của hai thuộc tính tùy chỉnh được đặt trên phần tử có `boxbg` áp dụng lên đó và sau đó sử dụng trong hàm `paint()`. Phương thức `inputProperties()` có thể trả về tất cả các thuộc tính ảnh hưởng đến phần tử, không chỉ các thuộc tính tùy chỉnh.

### Sử dụng paint worklet

#### HTML

```html
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
  <li>item 11</li>
  <li>item 12</li>
  <li>item 13</li>
  <li>item 14</li>
  <li>item 15</li>
  <li>item 16</li>
  <li>item 17</li>
  <li>item</li>
</ul>
```

#### CSS

Trong CSS, chúng ta định nghĩa các thuộc tính tùy chỉnh `--box-color` và `--width-subtractor`.

```css
li {
  background-image: paint(boxbg);
  --box-color: hsl(55 90% 60% / 100%);
}

li:nth-of-type(3n) {
  --box-color: hsl(155 90% 60% / 100%);
  --width-subtractor: 20;
}

li:nth-of-type(3n + 1) {
  --box-color: hsl(255 90% 60% / 100%);
  --width-subtractor: 40;
}
```

#### JavaScript

Trong `<script>` chúng ta đăng ký worklet:

```js
CSS.paintWorklet.addModule("boxbg.js");
```

#### Kết quả

Mặc dù bạn không thể thay đổi script của worklet, bạn có thể thay đổi các giá trị thuộc tính tùy chỉnh trong DevTools để thay đổi màu sắc và độ rộng của hình nền.

{{EmbedGHLiveSample("dom-examples/css-painting/custom-properties/", '100%', 400)}}

## Thêm độ phức tạp

Các ví dụ trên có vẻ không thú vị lắm, vì bạn có thể tái tạo chúng theo một số cách khác với các thuộc tính CSS hiện có. Điều làm cho CSS Painting API trở nên thú vị và mạnh mẽ là bạn có thể tạo các hình ảnh phức tạp, truyền biến, tự động thay đổi kích thước.

Hãy xem một ví dụ paint phức tạp hơn.

### Paint worklet

```js
registerPaint(
  "header-highlight",
  class {
    static get inputProperties() {
      return ["--high-color"];
    }
    static get contextOptions() {
      return { alpha: true };
    }

    paint(ctx, size, props) {
      /* set where to start the highlight & dimensions */
      const x = 0;
      const y = size.height * 0.3;
      const blockWidth = size.width * 0.33;
      const highlightHeight = size.height * 0.85;
      const color = props.get("--high-color");

      ctx.fillStyle = color;

      ctx.beginPath();
      ctx.moveTo(x, y);
      ctx.lineTo(blockWidth, y);
      ctx.lineTo(blockWidth + highlightHeight, highlightHeight);
      ctx.lineTo(x, highlightHeight);
      ctx.lineTo(x, y);
      ctx.closePath();
      ctx.fill();

      /* create the dashes */
      for (let start = 0; start < 8; start += 2) {
        ctx.beginPath();
        ctx.moveTo(blockWidth + start * 10 + 10, y);
        ctx.lineTo(blockWidth + start * 10 + 20, y);
        ctx.lineTo(
          blockWidth + start * 10 + 20 + highlightHeight,
          highlightHeight,
        );
        ctx.lineTo(
          blockWidth + start * 10 + 10 + highlightHeight,
          highlightHeight,
        );
        ctx.lineTo(blockWidth + start * 10 + 10, y);
        ctx.closePath();
        ctx.fill();
      }
    } // paint
  },
);
```

### Sử dụng paint worklet

Sau đó chúng ta có thể tạo một chút HTML sẽ chấp nhận hình ảnh này làm nền:

```html
<h1 class="fancy">Largest Header</h1>
<h3 class="fancy">Medium size header</h3>
<h6 class="fancy">Smallest Header</h6>
```

Chúng ta đặt cho mỗi tiêu đề một giá trị khác nhau cho [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Guides/Cascading_variables) `--high-color`

```css
.fancy {
  background-image: paint(header-highlight);
}
h1 {
  --high-color: hsl(155 90% 60% / 70%);
}
h3 {
  --high-color: hsl(255 90% 60% / 50%);
}
h6 {
  --high-color: hsl(355 90% 60% / 30%);
}
```

Và chúng ta đăng ký worklet của mình

```js
CSS.paintWorklet.addModule("header-highlight.js");
```

Kết quả trông như sau:

{{EmbedGHLiveSample("dom-examples/css-painting/fancy-header-highlight/", 200, 200)}}

Mặc dù bạn không thể chỉnh sửa worklet, bạn có thể thử nghiệm với CSS và HTML. Hãy thử {{cssxref("scale")}} và {{cssxref("rotate")}} trên các tiêu đề?

## Truyền tham số

> [!NOTE]
> Ví dụ sau yêu cầu bật cờ Experimental Web Platform features trong Chrome hoặc Edge bằng cách truy cập `about://flags`.

Với CSS Paint API, chúng ta không chỉ có quyền truy cập vào các thuộc tính tùy chỉnh và thuộc tính thông thường, mà còn có thể truyền các đối số tùy chỉnh vào hàm `paint()`.

Chúng ta có thể thêm các đối số bổ sung này khi gọi hàm trong CSS. Giả sử đôi khi chúng ta muốn vẽ viền nền thay vì tô màu, hãy truyền một đối số bổ sung cho trường hợp này.

```css
li {
  background-image: paint(hollow-highlights, stroke);
}
```

Bây giờ chúng ta có thể sử dụng phương thức `inputArguments()` trong lớp `registerPaint()` để truy cập đối số tùy chỉnh mà chúng ta đã thêm vào hàm `paint()`.

```js
class Worklet {
  static get inputArguments() {
    return ["*"];
  }
  // …
}
```

Sau đó chúng ta có quyền truy cập vào đối số đó.

```js
class Worklet {
  // …
  paint(ctx, size, props, args) {
    // use our custom arguments
    const hasStroke = args[0].toString();

    // if stroke arg is 'stroke', don't fill
    if (hasStroke === "stroke") {
      ctx.fillStyle = "transparent";
      ctx.strokeStyle = color;
    }
    // …
  }
  // …
}
```

Chúng ta cũng có thể chỉ định rằng chúng ta muốn một loại đối số cụ thể.

Giả sử chúng ta thêm đối số thứ hai với số pixel cho độ rộng viền:

```css
li {
  background-image: paint(hollow-highlights, stroke, 10px);
}
```

Khi chúng ta lấy danh sách giá trị đối số, chúng ta có thể yêu cầu cụ thể một đơn vị `<length>`.

```js
class Worklet {
  // …
  static get inputArguments() {
    return ["*", "<length>"];
  }
  // …
}
```

Trong trường hợp này, chúng ta yêu cầu cụ thể thuộc tính `<length>`. Phần tử đầu tiên trong mảng trả về sẽ là một {{domxref('CSSUnparsedValue')}}. Phần tử thứ hai sẽ là một {{domxref('CSSStyleValue')}}.

Nếu đối số tùy chỉnh là một giá trị CSS, ví dụ một đơn vị, chúng ta có thể gọi lớp Typed OM CSSStyleValue (và các lớp con) bằng cách sử dụng từ khóa loại giá trị khi chúng ta lấy nó trong hàm `registerPaint()`.

Bây giờ chúng ta có thể truy cập các thuộc tính type và value, nghĩa là chúng ta có thể lấy số pixel và một kiểu số ngay lập tức.

```js
class Worklet {
  // …
  paint(ctx, size, props, args) {
    const strokeWidth = args[1];

    if (strokeWidth.unit === "px") {
      ctx.lineWidth = strokeWidth.value;
    } else {
      ctx.lineWidth = 1.0;
    }

    // …
  }
  // …
}
```

Đáng chú ý sự khác biệt giữa việc sử dụng các thuộc tính tùy chỉnh để kiểm soát các phần khác nhau của worklet này và các đối số được đặt ở đây. Các thuộc tính tùy chỉnh (và thực tế là bất kỳ thuộc tính nào trên style map) là toàn cục, chúng có thể được sử dụng ở nơi khác trong CSS (và JS).

### Paint worklet

```js
registerPaint(
  "hollow-highlights",
  class {
    static get inputProperties() {
      return ["--box-color"];
    }
    // Input arguments that can be passed to the `paint` function
    static get inputArguments() {
      return ["*", "<length>"];
    }

    static get contextOptions() {
      return { alpha: true };
    }

    paint(ctx, size, props, args) {
      // ctx   -> drawing context
      // size  -> size of the box being painted
      // props -> list of custom properties available to the element
      // args  -> list of arguments set when calling the paint() function in the CSS

      // where to start the highlight & dimensions
      const x = 0;
      const y = size.height * 0.3;
      const blockWidth = size.width * 0.33;
      const blockHeight = size.height * 0.85;

      // the values passed in the paint() function in the CSS
      const color = props.get("--box-color");
      const strokeType = args[0].toString();
      const strokeWidth = parseInt(args[1], 10);

      // set the stroke width
      ctx.lineWidth = strokeWidth ?? 1.0;
      // set the fill type
      if (strokeType === "stroke") {
        ctx.fillStyle = "transparent";
        ctx.strokeStyle = color;
      } else if (strokeType === "filled") {
        ctx.fillStyle = color;
        ctx.strokeStyle = color;
      } else {
        ctx.fillStyle = "none";
        ctx.strokeStyle = "none";
      }

      // block
      ctx.beginPath();
      ctx.moveTo(x, y);
      ctx.lineTo(blockWidth, y);
      ctx.lineTo(blockWidth + blockHeight, blockHeight);
      ctx.lineTo(x, blockHeight);
      ctx.lineTo(x, y);
      ctx.closePath();
      ctx.fill();
      ctx.stroke();
      // dashes
      for (let i = 0; i < 4; i++) {
        let start = i * 2;
        ctx.beginPath();
        ctx.moveTo(blockWidth + start * 10 + 10, y);
        ctx.lineTo(blockWidth + start * 10 + 20, y);
        ctx.lineTo(blockWidth + start * 10 + 20 + blockHeight, blockHeight);
        ctx.lineTo(blockWidth + start * 10 + 10 + blockHeight, blockHeight);
        ctx.lineTo(blockWidth + start * 10 + 10, y);
        ctx.closePath();
        ctx.fill();
        ctx.stroke();
      }
    } // paint
  },
);
```

### Sử dụng paint worklet

Chúng ta có thể đặt các màu khác nhau, độ rộng viền và chọn xem hình nền nên được tô hay rỗng:

```css
li {
  --box-color: hsl(155 90% 60% / 50%);
  background-image: paint(hollow-highlights, stroke, 5px);
}

li:nth-of-type(3n) {
  --box-color: hsl(255 90% 60% / 50%);
  background-image: paint(hollow-highlights, filled, 3px);
}

li:nth-of-type(3n + 1) {
  --box-color: hsl(355 90% 60% / 50%);
  background-image: paint(hollow-highlights, stroke, 1px);
}
```

```html hidden
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
  <li>item 11</li>
  <li>item 12</li>
  <li>item 13</li>
  <li>item 14</li>
  <li>item 15</li>
  <li>item 16</li>
  <li>item 17</li>
  <li>item</li>
</ul>
```

Trong `<script>` chúng ta đăng ký worklet:

```js
CSS.paintWorklet.addModule("hollow.js");
```

{{EmbedGHLiveSample("dom-examples/css-painting/hollow-highlight", 400, 400)}}

## Xem thêm

- [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API)
- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
