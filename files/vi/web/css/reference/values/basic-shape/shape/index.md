---
title: shape()
slug: Web/CSS/Reference/Values/basic-shape/shape
page-type: css-function
browser-compat: css.types.basic-shape.shape
sidebar: cssref
---

Hàm **`shape()`** trong [CSS](/vi/docs/Web/CSS) là một [hàm CSS](/vi/docs/Web/CSS/Reference/Values/Functions) được dùng để định nghĩa hình dạng cho các thuộc tính {{cssxref("clip-path")}} và {{cssxref("offset-path")}}. Nó kết hợp điểm bắt đầu ban đầu với một chuỗi các lệnh hình dạng xác định đường đi của hình dạng. Hàm `shape()` là thành viên của kiểu dữ liệu {{cssxref("basic-shape")}}.

## Cú pháp

```css
/* <fill-rule> */
clip-path: shape(nonzero from 0 0, line to 10px 10px);

/* <move-command>, <line-command>, và close */
offset-path: shape(from 10px 10px, move by 10px 5px, line by 20px 40%, close);

/* <hvline-command> */
offset-path: shape(from 10px 10px, hline by 50px, vline to 5rem);

/* <curve-command> */
offset-path: shape(
  from 10px 10px,
  curve to 80px 80px with 160px 1px / 20% 16px
);

/* <smooth-command> */
offset-path: shape(from 10px 10px, smooth to 100px 50pt);

/* <arc-command> */
offset-path: shape(
  from 5% 0.5rem,
  arc to 80px 1pt of 10% ccw large rotate 25deg
);

/* Sử dụng hàm toán học CSS */
offset-path: shape(
  from 5px -5%,
  hline to 50px,
  vline by calc(0% + 160px),
  hline by 70.5px,
  close,
  vline by 60px
);

clip-path: shape(
  evenodd from 10px 10px,
  curve to 60px 20% with 40px 0,
  smooth to 90px 0,
  curve by -20px 60% with 10% 40px / 20% 20px,
  smooth by -40% -10px with -10px 70px,
  close
);
```

### Tham số

- [`<fill-rule>`](/vi/docs/Web/SVG/Reference/Attribute/fill-rule) {{optional_inline}}
  - : Chỉ định cách các vùng chồng lên nhau của hình dạng nên được tô màu. Các giá trị có thể bao gồm:
    - `nonzero`: Một điểm được coi là nằm bên trong hình dạng nếu tia vẽ từ điểm đó đi qua nhiều đoạn đường từ trái sang phải hơn là từ phải sang trái, tạo ra kết quả khác không. Đây là giá trị mặc định khi `<fill-rule>` bị bỏ qua.

    - `evenodd`: Một điểm được coi là nằm bên trong hình dạng nếu tia vẽ từ điểm đó đi qua một số lẻ đoạn đường. Điều này có nghĩa là mỗi lần tia đi vào hình dạng, nó chưa thoát ra một số lần bằng nhau, cho thấy số lần vào lẻ mà không có lối ra tương ứng.

    > [!WARNING]
    > `<fill-rule>` không được hỗ trợ trong {{cssxref("offset-path")}} và việc sử dụng nó sẽ làm thuộc tính không hợp lệ.

- `from <coordinate-pair>`
  - : Xác định điểm bắt đầu của `<shape-command>` đầu tiên dưới dạng một cặp tọa độ được đo từ góc trên-trái của [hộp tham chiếu](/vi/docs/Web/CSS/Guides/Shapes/Using_shape-outside#the_reference_box). Tọa độ được chỉ định dưới dạng các giá trị {{cssxref("&lt;length-percentage&gt;")}} `<x> <y>` phân cách bằng dấu cách, lần lượt đại diện cho độ lệch trái và độ lệch trên. Các giá trị phần trăm tương đối với chiều rộng và chiều cao của hộp tham chiếu của phần tử. Thêm dấu phẩy sau tham số này.

- `<shape-command>`
  - : Chỉ định danh sách một hoặc nhiều lệnh phân cách bằng dấu phẩy xác định hình dạng, sử dụng cú pháp tương tự [lệnh đường dẫn SVG](/vi/docs/Web/SVG/Reference/Attribute/d#path_commands). Các lệnh bao gồm `<move-command>`, `<line-command>`, `<hv-line-command>`, `<curve-command>`, `<smooth-command>`, `<arc-command>`, và `close`. Điểm bắt đầu của mỗi lệnh là điểm kết thúc của lệnh trước, với điểm đầu tiên của hình dạng được xác định bởi tham số [`from <coordinate-pair>`](#from_coordinate-pair).

#### Các lệnh hình dạng

Cú pháp của hầu hết các lệnh hình dạng là một từ khóa cung cấp chỉ thị, như `move` hay `line`, theo sau là từ khóa `by` hoặc `to`, và một tập hợp tọa độ.

- `by`: Cho biết `<coordinate-pair>` là tương đối với điểm bắt đầu của lệnh (giá trị "tương đối").
- `to`: Cho biết `<coordinate-pair>` là tương đối với góc trên-trái của hộp tham chiếu (giá trị "tuyệt đối").

> [!NOTE]
> Nếu một tọa độ trong `<coordinate-pair>` được chỉ định dưới dạng phần trăm, giá trị được tính toán tương đối với chiều rộng hoặc chiều cao tương ứng của hộp tham chiếu.

Các `<shape-command>` sau đây có thể được chỉ định:

- `<move-command>`
  - : Chỉ định dưới dạng `move [by | to] <coordinate-pair>`. Lệnh này thêm một [lệnh MoveTo](/vi/docs/Web/SVG/Reference/Attribute/d#moveto_path_commands) vào danh sách các lệnh hình dạng. Nó không vẽ gì; thay vào đó, nó chỉ định vị trí bắt đầu cho lệnh tiếp theo. Từ khóa `by` hoặc `to` chỉ định điểm `<coordinate-pair>` là tương đối hay tuyệt đối. Nếu `<move-command>` theo sau lệnh `close`, nó xác định điểm bắt đầu của hình dạng hoặc đường dẫn con tiếp theo.

- `<line-command>`
  - : Chỉ định dưới dạng `line [by | to] <coordinate-pair>`. Lệnh này thêm một [lệnh LineTo](/vi/docs/Web/SVG/Reference/Attribute/d#lineto_path_commands) vào danh sách các lệnh hình dạng. Nó vẽ một đường thẳng từ điểm bắt đầu đến điểm kết thúc của lệnh. Từ khóa `by` hoặc `to` chỉ định điểm kết thúc được xác định bởi `<coordinate-pair>` là tương đối hay tuyệt đối.

- `<hv-line-command>`
  - : Chỉ định dưới dạng `[hline | vline] [by | to] <length-percentage>`. Lệnh này thêm lệnh [LineTo](/vi/docs/Web/SVG/Reference/Attribute/d#lineto_path_commands) ngang (`hline`) hoặc dọc (`vline`) vào danh sách các lệnh hình dạng. Với `hline`, một đường ngang được vẽ từ điểm bắt đầu của lệnh `to` hoặc `by` vị trí `x` được xác định bởi `<length-percentage>`. Với `vline`, một đường dọc được vẽ từ điểm bắt đầu của lệnh `to` hoặc `by` vị trí `y` được xác định bởi `<length-percentage>`. Từ khóa `by` hoặc `to` xác định điểm kết thúc tương đối hay tuyệt đối. Lệnh này tương đương với `<line-command>` với một giá trị tọa độ được đặt bởi `<length-percentage>` duy nhất và giá trị tọa độ kia không thay đổi so với lệnh bắt đầu.

- `<curve-command>`
  - : Chỉ định dưới dạng `curve [by | to] <end-point> with <control-point> [/ <control-point>]`. Lệnh này thêm một [lệnh đường cong Bézier](/vi/docs/Web/SVG/Reference/Attribute/d#cubic_bézier_curve) vào danh sách các lệnh hình dạng. Từ khóa `by` hoặc `to` xác định điểm kết thúc của đường cong, được chỉ định bởi `<end-point>`, là tương đối hay tuyệt đối.

    Từ khóa `with` chỉ định các điểm kiểm soát của đường cong Bézier như sau:
    - Nếu chỉ cung cấp một `<control-point>`, lệnh vẽ [đường cong Bézier bậc hai](/vi/docs/Web/SVG/Reference/Attribute/d#quadratic_bézier_curve), được xác định bởi ba điểm (điểm bắt đầu, điểm kiểm soát, và điểm kết thúc).
    - Nếu cung cấp hai giá trị `<control-point>`, lệnh vẽ đường cong Bézier bậc ba, được xác định bởi bốn điểm (điểm bắt đầu, hai điểm kiểm soát, và điểm kết thúc).

    Các giá trị hợp lệ cho `<end-point>` bao gồm:
    - Từ khóa {{cssxref("&lt;position>")}} hoặc `<coordinate-value-pair>`
      - : Có thể dùng nếu điểm kết thúc của đường cong là tuyệt đối (chỉ định bằng `to`).
    - `<coordinate-value-pair>`
      - : Có thể dùng nếu điểm kết thúc của đường cong là tương đối (chỉ định bằng `by`).

    Các giá trị hợp lệ cho `<control-point>` bao gồm:
    - {{cssxref("&lt;position>")}}
      - : Chỉ định một từ khóa vị trí. Giá trị này chỉ hợp lệ khi điểm kết thúc của đường cong là tuyệt đối (chỉ định bằng `to`).
    - `<coordinate-value-pair>`
      - : Chỉ định một cặp giá trị {{cssxref("&lt;length-percentage>")}} xác định tọa độ.
    - `<relative-control-point>`
      - : Xác định `<coordinate-value-pair>` theo sau từ khóa `from` và một trong các từ khóa sau:
        - `start`
          - : Cho biết điểm kiểm soát là tương đối với điểm bắt đầu của lệnh hiện tại.
        - `end`
          - : Cho biết điểm kiểm soát là tương đối với điểm kết thúc của lệnh hiện tại.
        - `origin`
          - : Cho biết điểm kiểm soát là tương đối với điểm trên-trái (origin) của container mà hình dạng đang được vẽ bên trong.
            > [!NOTE]
            > Nếu các từ khóa `<relative-control-point>` không được chỉ định, làm cho `<control-point>` là một `<coordinate-value-pair>` thông thường, các tọa độ là tương đối với điểm bắt đầu của đường cong. Nói cách khác, `start` là cài đặt mặc định.

- `<smooth-command>`
  - : Chỉ định dưới dạng `smooth [by | to] <end-point> [with <control-point>]`. Lệnh này thêm một [lệnh đường cong Bézier](/vi/docs/Web/SVG/Reference/Attribute/d#cubic_bézier_curve) mượt mà vào danh sách các lệnh hình dạng. Từ khóa `by` hoặc `to` xác định điểm kết thúc của đường cong, được chỉ định bởi `<end-point>`, là tương đối hay tuyệt đối.

    Từ khóa `with` chỉ định một điểm kiểm soát tùy chọn cho đường cong Bézier:
    - Nếu `with <control-point>` bị bỏ qua, lệnh vẽ đường cong Bézier bậc hai mượt mà, sử dụng điểm kiểm soát trước đó và điểm kết thúc hiện tại để xác định đường cong.
    - Nếu từ khóa `with` tùy chọn được bao gồm, nó chỉ định điểm kiểm soát của đường cong thông qua `<control-point>`, vẽ đường cong Bézier bậc ba mượt mà được xác định bởi điểm kiểm soát trước đó, điểm kiểm soát hiện tại, và điểm kết thúc hiện tại.

    Các đường cong mượt mà đảm bảo sự chuyển tiếp liên tục từ hình dạng, trong khi các đường cong bậc hai thì không. Các đường cong bậc hai mượt mà duy trì sự chuyển tiếp liền mạch sử dụng một điểm kiểm soát duy nhất, trong khi các đường cong bậc ba mượt mà cung cấp sự chuyển tiếp được tinh chỉnh hơn sử dụng hai điểm kiểm soát.

    Các giá trị hợp lệ cho các thành phần `<end-point>` và `<control-point>` giống như những giá trị của [`<curve-command>`](#curve-command).

- `<arc-command>`
  - : Chỉ định dưới dạng `arc [by | to] <coordinate-pair> of <length-percentage> [<length-percentage>] [<arc-sweep> | <arc-size> | rotate <angle>]`. Lệnh này thêm một [lệnh đường cong cung elip](/vi/docs/Web/SVG/Reference/Attribute/d#elliptical_arc_curve) vào danh sách các lệnh hình dạng. Nó vẽ một cung elip giữa điểm bắt đầu và điểm kết thúc. Từ khóa `by` hoặc `to` xác định điểm kết thúc của đường cong, được chỉ định bởi `<coordinate-pair>` đầu tiên, là tương đối hay tuyệt đối.

    Lệnh đường cong cung elip xác định hai elip có thể có, cắt nhau tại cả điểm bắt đầu và điểm kết thúc, và mỗi elip có thể được theo dõi theo chiều kim đồng hồ hoặc ngược chiều kim đồng hồ, tạo ra bốn cung có thể tùy thuộc vào kích thước cung, hướng và góc. Từ khóa `of` chỉ định kích thước của elip từ đó cung được lấy: `<length-percentage>` đầu tiên cung cấp bán kính ngang của elip, và `<length-percentage>` thứ hai cung cấp bán kính dọc.

    Chỉ định các tham số sau để chọn cung nào trong bốn cung sử dụng:
    - `<arc-sweep>`: Cho biết cung mong muốn là cung được theo dõi xung quanh elip theo chiều kim đồng hồ (`cw`) hay ngược chiều kim đồng hồ (`ccw`). Nếu bị bỏ qua, mặc định là `ccw`.
    - `<arc-size>`: Cho biết cung mong muốn là cung lớn hơn (`large`) hay nhỏ hơn (`small`) trong hai cung. Nếu bị bỏ qua, mặc định là `small`.
    - `<angle>`: Chỉ định góc, tính bằng độ, để xoay elip so với trục x. Góc dương xoay elip theo chiều kim đồng hồ, và góc âm xoay ngược chiều kim đồng hồ. Nếu bị bỏ qua, mặc định là `0deg`.

    Các tình huống đặc biệt được xử lý như sau:
    - Nếu chỉ cung cấp một `<length-percentage>`, cùng giá trị được dùng cho cả bán kính ngang và dọc, thực tế tạo ra một hình tròn. Trong trường hợp này, `<arc-size>` và `<angle>` không có ảnh hưởng.
    - Nếu một trong hai bán kính là không, lệnh tương đương với `<line-command>` đến điểm kết thúc.
    - Nếu một trong hai bán kính là âm, giá trị tuyệt đối của nó được sử dụng thay thế.
    - Nếu bán kính ngang và dọc không mô tả một elip đủ lớn để cắt qua cả điểm bắt đầu và kết thúc (sau khi xoay theo `<angle>` được chỉ định), các bán kính được mở rộng đồng đều cho đến khi elip vừa đủ lớn để cắt qua cả hai điểm.
    - Nếu điểm bắt đầu và điểm kết thúc của cung nằm ở hai phía đối diện chính xác của elip, chỉ có một elip có thể có và hai cung có thể có. Trong trường hợp này, `<arc-sweep>` chỉ định cung cần chọn, và `<arc-size>` không có ảnh hưởng.

- `close`
  - : Thêm một [lệnh ClosePath](/vi/docs/Web/SVG/Reference/Attribute/d#closepath) vào danh sách các lệnh hình dạng, vẽ một đường thẳng từ vị trí hiện tại (kết thúc lệnh cuối cùng) đến điểm đầu tiên trong đường dẫn được xác định trong tham số `from <coordinate-pair>`. Để đóng hình dạng mà không vẽ đường thẳng, hãy bao gồm `<move-command>` với tọa độ gốc trước lệnh close. Nếu lệnh `close` ngay sau đó là `<move-command>`, nó xác định điểm bắt đầu của hình dạng hoặc đường dẫn con tiếp theo.

## Mô tả

Hàm `shape()` cho phép bạn định nghĩa các hình dạng phức tạp. Nó tương tự với hàm hình dạng {{cssxref("basic-shape/path","path()")}} theo một số cách:

- Tham số `<fill-rule>` trong hàm `shape()` hoạt động chính xác như tham số tương tự trong hàm `path()`.
- Hàm `shape()` yêu cầu chỉ định một hoặc nhiều `<shape-command>`, trong đó mỗi lệnh sử dụng một [lệnh đường dẫn](/vi/docs/Web/SVG/Reference/Attribute/d#path_commands) cơ bản, chẳng hạn như [MoveTo](/vi/docs/Web/SVG/Reference/Attribute/d#moveto_path_commands), [LineTo](/vi/docs/Web/SVG/Reference/Attribute/d#lineto_path_commands), và [ClosePath](/vi/docs/Web/SVG/Reference/Attribute/d#closepath).

Tuy nhiên, `shape()` cung cấp một số ưu điểm so với `path()`:

- `shape()` sử dụng cú pháp CSS chuẩn, giúp dễ dàng tạo và chỉnh sửa hình dạng trực tiếp trong stylesheet của bạn. Trong khi đó, `path()` sử dụng cú pháp [đường dẫn SVG](/vi/docs/Web/SVG/Reference/Element/path), ít trực quan hơn với những người không quen với SVG.
- `shape()` hỗ trợ nhiều đơn vị CSS, bao gồm phần trăm, `rem`, và `em`. `path()`, ngược lại, định nghĩa hình dạng dưới dạng một chuỗi duy nhất và giới hạn đơn vị là `px`.
- `shape()` cũng cho phép sử dụng các hàm toán học CSS, như {{cssxref("calc")}}, {{cssxref("max")}}, và {{cssxref("abs")}}, cung cấp thêm tính linh hoạt khi định nghĩa hình dạng.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng `shape()` để định nghĩa đường dẫn

Ví dụ này minh họa cách hàm `shape()` có thể được dùng trong thuộc tính {{cssxref("offset-path")}} để định nghĩa hình dạng của đường dẫn mà phần tử có thể đi theo.

Hình dạng đầu tiên, `shape1`, đi theo đường cong Bézier bậc ba được xác định bởi lệnh `curve to`. Tiếp theo, lệnh `close` vẽ đường thẳng từ điểm kết thúc của đường cong trở về điểm ban đầu được xác định trong lệnh `from`. Cuối cùng, `shape1` di chuyển đến vị trí mới tại `0px 150px` rồi tiếp tục theo một đường ngang.

Hình dạng thứ hai, `shape2`, ban đầu đi theo một đường ngang, sau đó di chuyển trở về vị trí bắt đầu tại `50px 90px`. Tiếp theo, nó đi theo đường dọc trước khi đóng đường dẫn trở về điểm ban đầu.

Cả hai hình dạng bắt đầu với màu sắc gốc và dần chuyển sang `hotpink` ở cuối hoạt hình `move`, rồi trở về màu gốc khi hoạt hình khởi động lại. Sự thay đổi màu sắc theo chu kỳ này cung cấp cho bạn tín hiệu trực quan về tiến trình và sự khởi động lại của hoạt hình.

```html hidden
<div class="container">
  Using <code>&lt;curve-command&gt;</code>
  <div class="shape shape1">>></div>
</div>

<div class="container">
  Using <code>&lt;move-command&gt;</code> and
  <code>&lt;hvline-command&gt;</code>
  <div class="shape shape2">>></div>
</div>
```

```css hidden
body {
  align-items: center;
  justify-content: center;
  display: flex;
}

.container {
  position: relative;
  display: inline-block;
  width: 250px;
  height: 250px;
  border: 2px dotted green;
  margin: 20px;
}

@supports not (offset-path: shape(from 0 0, move to 0 0)) {
  .container {
    display: none;
  }
  body::after {
    content: "Your browser doesn't support the `shape()` function yet.";
  }
}
```

```css
.shape {
  width: 50px;
  height: 50px;
  background: #2bc4a2;
  position: absolute;
  text-align: center;
  line-height: 50px;
  animation: move 6s infinite linear;
}

.shape1 {
  offset-path: shape(
    from 30% 60px,
    curve to 180px 180px with 90px 190px,
    close,
    move by 0px 150px,
    hline by 40%
  );
}

.shape2 {
  offset-path: shape(
    from 50px 90px,
    hline to 8em,
    move to 50px 90px,
    vline by 20%,
    close
  );
}

@keyframes move {
  0% {
    offset-distance: 0%;
  }
  100% {
    offset-distance: 100%;
    background-color: hotpink;
  }
}
```

#### Kết quả

{{EmbedLiveSample('Using shape() to define a path', '100%', 300)}}

### Sử dụng `shape()` để định nghĩa phần hiển thị của phần tử

Ví dụ này minh họa cách hàm `shape()` có thể được dùng trong thuộc tính {{cssxref("clip-path")}} để tạo các hình dạng khác nhau cho vùng cắt. Hình dạng đầu tiên (`shape1`) sử dụng tam giác được xác định bởi các đường thẳng. Hình dạng thứ hai (`shape2`) bao gồm các đường cong và chuyển tiếp mượt mà; nó cũng minh họa việc sử dụng `<move-command>` sau lệnh `close`, thêm hình chữ nhật vào vùng cắt.

```html hidden
<div class="container">
  <div class="shape shape1"></div>
</div>

<div class="container">
  <div class="shape shape2"></div>
</div>
```

```css hidden
body {
  align-items: center;
  justify-content: center;
  display: flex;
}

.container {
  position: relative;
  display: inline-block;
  width: 200px;
  height: 200px;
  margin: 20px;
  background-color: lightgray;
}

@supports not (clip-path: shape(from 0 0, move to 0 0)) {
  .container {
    display: none;
  }
  body::after {
    content: "Your browser doesn't support the `shape()` function yet.";
  }
}
```

```css
.shape {
  width: 100%;
  height: 100%;
  background: #2bc4a2;
  position: absolute;
  text-align: center;
  line-height: 50px;
}

/* Vùng cắt hình tam giác */
.shape1 {
  clip-path: shape(from 0% 0%, line to 100% 0%, line to 50% 100%, close);
}

/* Vùng cắt hình trái tim sử dụng chuyển tiếp đường cong và cung
   và một hộp sử dụng chuyển tiếp hline và vline */
.shape2 {
  clip-path: shape(
    from 20px 70px,
    arc to 100px 70px of 1% cw,
    arc to 180px 70px of 1% cw,
    curve to 100px 190px with 180px 130px,
    curve to 20px 70px with 20px 130px,
    close,
    move to 150px 150px,
    hline by 40px,
    vline by 40px,
    hline by -40px,
    close
  );
}
```

#### Kết quả

{{EmbedLiveSample('Using shape() to define the visible part of an element', '100%', 300)}}

### Sử dụng `shape()` để vẽ đường cong với điểm kiểm soát tương đối

Giống như các ví dụ trước, ví dụ này cũng sử dụng {{cssxref("clip-path")}} để tạo các hình dạng khác nhau cho các vùng cắt của các phần tử. Các hình dạng được chỉ định bằng sự kết hợp của [`<curve-command>`](#curve-command) và [`<smooth-command>`](#smooth-command), và các điểm kiểm soát được chỉ định bằng các giá trị [`<relative-control-point>`](#relative-control-point).

Hình dạng đầu tiên (`shape1`) vẽ hai đường cong Bézier bậc ba.

- Đường cong đầu tiên bắt đầu từ trung tâm cạnh trái của hộp và được vẽ đến một điểm cách `200px` theo trục x — trung tâm cạnh phải của hộp. Nó sử dụng một điểm kiểm soát tương đối với điểm bắt đầu của đường cong và một điểm kiểm soát tương đối với origin (góc trên-trái của hộp).
- Đường cong thứ hai bắt đầu từ giữa-phải của hộp và được vẽ `-200px` theo trục x — trung tâm cạnh trái của hộp. Nó sử dụng một điểm kiểm soát tương đối với origin và một điểm kiểm soát tương đối với điểm bắt đầu của đường cong.

```html hidden live-sample___relative-control-points
<div class="container">
  <div id="shape1"></div>
  <div id="shape2"></div>
  <div id="shape3"></div>
</div>
```

```css hidden live-sample___relative-control-points
.container {
  display: flex;
  justify-content: center;
  gap: 20px;
}

@supports not (
  clip-path: shape(
      from center left,
      curve by 200px 0 with 50% -50% from start / 50% 0 from origin,
      curve by -200px 0 with 50% 100% from origin / -50% 50% from start,
      close
    )
) {
  .container {
    display: none;
  }
  body::after {
    content: "Your browser doesn't support `shape()` relative control points.";
  }
}
```

```css live-sample___relative-control-points
#shape1 {
  width: 200px;
  height: 200px;
  background: green;
  clip-path: shape(
    from center left,
    curve by 200px 0 with 50% -50% from start / 50% 0 from origin,
    curve by -200px 0 with 50% 100% from origin / -50% 50% from start,
    close
  );
}
```

Hình dạng thứ hai (`shape2`) vẽ một đường cong Bézier bậc hai và một đường cong Bézier bậc ba.

- Đường cong đầu tiên bắt đầu từ trung tâm cạnh trái của hộp và được vẽ đến một điểm tuyệt đối cách `200px` từ origin theo trục x và `100px` từ origin theo trục y. Nó sử dụng một điểm kiểm soát tương đối với điểm bắt đầu của đường cong.
- Đường cong thứ hai bắt đầu từ điểm kết thúc của đường cong trước và được vẽ về trung tâm trái của hộp. Nó sử dụng một điểm kiểm soát tương đối với điểm bắt đầu của đường cong và một điểm kiểm soát tương đối với điểm kết thúc.

```css live-sample___relative-control-points
#shape2 {
  width: 200px;
  height: 200px;
  background: purple;
  clip-path: shape(
    from center left,
    curve to 200px 100px with 50% -80% from start,
    curve to center left with 0% 70% from start / 20% 0% from end,
    close
  );
}
```

Hình dạng thứ ba (`shape3`) vẽ một đường cong Bézier bậc hai và một đường cong Bézier bậc ba bằng lệnh `smooth`.

- Đường cong đầu tiên bắt đầu từ trung tâm cạnh trái của hộp và được vẽ đến một điểm cách `200px` theo trục x. Nó sử dụng một điểm kiểm soát tương đối với điểm bắt đầu của đường cong.
- Đường cong thứ hai bắt đầu từ điểm kết thúc của đường cong trước và được vẽ về trung tâm của hộp. Nó sử dụng một điểm kiểm soát tương đối với điểm bắt đầu của đường cong (điểm kiểm soát cuối cùng của đường cong trước) và một điểm kiểm soát tương đối với origin.

```css live-sample___relative-control-points
#shape3 {
  width: 200px;
  height: 200px;
  background: orangered;
  clip-path: shape(
    from center left,
    curve by 200px 0px with 50% -80% from start,
    smooth to center with 50% 100% from origin,
    close
  );
}
```

#### Kết quả

{{EmbedLiveSample('relative-control-points', '100%', 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("clip-path")}}
- {{cssxref("offset-path")}}
- Module [CSS shapes](/vi/docs/Web/CSS/Guides/Shapes)
- Hướng dẫn [Tổng quan về shapes](/vi/docs/Web/CSS/Guides/Shapes/Overview)
- Hướng dẫn [Basic shapes](/vi/docs/Web/CSS/Guides/Shapes/Using_shape-outside)
