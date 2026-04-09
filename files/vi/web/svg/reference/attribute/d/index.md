---
title: d
slug: Web/SVG/Reference/Attribute/d
page-type: svg-attribute
browser-compat: svg.elements.path.d
sidebar: svgref
---

Thuộc tính **`d`** xác định một đường dẫn sẽ được vẽ.

Một định nghĩa đường dẫn là một danh sách [các lệnh đường dẫn](#path_commands), trong đó mỗi lệnh gồm một ký tự lệnh và các số đại diện cho tham số của lệnh.
Các lệnh này được [mô tả chi tiết bên dưới](#path_commands).

Thuộc tính này được dùng với phần tử SVG [`<path>`](#path).

`d` là một presentation attribute, và do đó cũng có thể được [dùng như một thuộc tính CSS](#using_d_as_a_css_property).

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <path
    fill="none"
    stroke="red"
    d="M 10,30
       A 20,20 0,0,1 50,30
       A 20,20 0,0,1 90,30
       Q 90,60 50,90
       Q 10,60 10,30 z" />
</svg>
```

{{EmbedLiveSample('Example', '100%', 200)}}

## path

Đối với {{SVGElement('path')}}, `d` là một chuỗi chứa một loạt lệnh đường dẫn xác định đường dẫn sẽ được vẽ.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <strong><a href="/en-US/docs/Web/CSS/Reference/Values/string">&#x3C;string></a></strong>
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Dùng d như một thuộc tính CSS

`d` là một presentation attribute, và do đó cũng có thể được sửa đổi bằng CSS.
Thuộc tính này nhận hoặc {{cssxref("basic-shape/path")}} hoặc `none`.

Ví dụ dưới đây cho thấy cách bạn có thể áp dụng một đường dẫn mới khi hover lên một phần tử.
Đường dẫn mới giống như đường dẫn cũ, nhưng thêm một đường thẳng ngang qua hình trái tim.

```css
html,
body,
svg {
  height: 100%;
}

/* This path is displayed on hover */
#svg_css_ex1:hover path {
  d: path(
    "M10,30 A20,20 0,0,1 50,30 A20,20 0,0,1 90,30 Q90,60 50,90 Q10,60 10,30 z M5,5 L90,90"
  );
}
```

```html
<svg id="svg_css_ex1" viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <path
    fill="none"
    stroke="red"
    d="M 10,30
       A 20,20 0,0,1 50,30
       A 20,20 0,0,1 90,30
       Q 90,60 50,90
       Q 10,60 10,30 z
       " />
</svg>
```

{{EmbedLiveSample('Using d as a CSS Property', '100%', 200)}}

Để xem ví dụ hoạt ảnh cho `<path>`, hãy xem trang tham chiếu thuộc tính CSS {{cssxref("d")}}.

## Các lệnh đường dẫn

Các lệnh đường dẫn là các chỉ dẫn xác định một đường dẫn sẽ được vẽ. Mỗi lệnh gồm một ký tự lệnh và các số đại diện cho tham số của lệnh.

SVG định nghĩa 6 loại lệnh đường dẫn, tổng cộng 20 lệnh:

- [MoveTo](#moveto_path_commands): `M`, `m`
- [LineTo](#lineto_path_commands): `L`, `l`, `H`, `h`, `V`, `v`
- [Cubic Bézier curve](#cubic_bézier_curve): `C`, `c`, `S`, `s`
- [Quadratic Bézier curve](#quadratic_bézier_curve): `Q`, `q`, `T`, `t`
- [Elliptical arc curve](#elliptical_arc_curve): `A`, `a`
- [ClosePath](#closepath): `Z`, `z`

> [!NOTE]
> Các lệnh là _phân biệt chữ hoa chữ thường_. Một lệnh viết hoa chỉ định tọa độ tuyệt đối, trong khi lệnh viết thường chỉ định tọa độ tương đối so với vị trí hiện tại.

Luôn có thể chỉ định một giá trị âm làm đối số cho một lệnh:

- góc âm sẽ quay ngược chiều kim đồng hồ;
- các giá trị _x_ và _y_ âm _tuyệt đối_ được hiểu là tọa độ âm;
- các giá trị _x_ âm _tương đối_ di chuyển sang trái, và các giá trị _y_ âm tương đối di chuyển lên trên.

### Các lệnh MoveTo

Các chỉ dẫn _MoveTo_ có thể được hiểu như việc nhấc dụng cụ vẽ lên, rồi đặt nó xuống một nơi khác - nói cách khác, di chuyển _điểm hiện tại_ (_P<sub>o</sub>_; {_x<sub>o</sub>_, _y<sub>o</sub>_}). Không có đường nào được vẽ giữa _P<sub>o</sub>_ và _điểm hiện tại_ mới (_P<sub>n</sub>_; {_x<sub>n</sub>_, _y<sub>n</sub>_}).

<table class="no-markdown">
  <tbody>
    <tr>
      <th scope="col">Lệnh</th>
      <th scope="col">Tham số</th>
      <th scope="col">Ghi chú</th>
    </tr>
    <tr>
      <th scope="row">M</th>
      <td>
        (<code><var>x</var></code
        >, <code><var>y</var></code
        >)+
      </td>
      <td>
        <p>
          Di chuyển <em>điểm hiện tại</em> tới tọa độ
          <code><var>x</var></code
          >,<code><var>y</var></code
          >. Mọi cặp tọa độ tiếp theo được hiểu là tham số cho các lệnh LineTo
          tuyệt đối ngầm định (<code>L</code>) (<em>xem bên dưới</em>).
        </p>
        <p>
          <strong>Công thức:</strong> <var>P<sub>n</sub></var> = {<code
            ><var>x</var></code
          >, <code><var>y</var></code
          >}
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">m</th>
      <td>
        (<code><var>dx</var></code
        >, <code><var>dy</var></code
        >)+
      </td>
      <td>
        <p>
          Di chuyển <em>điểm hiện tại</em> bằng cách dời vị trí đã biết cuối
          cùng của đường đi theo <code><var>dx</var></code> dọc trục x và theo
          <code><var>dy</var></code> dọc trục y. Mọi cặp tọa độ tiếp theo được
          hiểu là tham số cho các lệnh LineTo tương đối ngầm định
          (<code>l</code>) (<em>xem bên dưới</em>).
        </p>
        <p>
          <strong>Công thức:</strong> <var>P<sub>n</sub></var> = {<var
            >x<sub>o</sub></var
          >
          + <code><var>dx</var></code
          >, <var>y<sub>o</sub></var> + <code><var>dy</var></code
          >}
        </p>
      </td>
    </tr>
  </tbody>
</table>

#### Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <path
    fill="none"
    stroke="red"
    d="M 10,10 h 10
       m  0,10 h 10
       m  0,10 h 10
       M 40,20 h 10
       m  0,10 h 10
       m  0,10 h 10
       m  0,10 h 10
       M 50,50 h 10
       m-20,10 h 10
       m-20,10 h 10
       m-20,10 h 10" />
</svg>
```

{{EmbedLiveSample('MoveTo_path_commands', '100%', 200)}}

### Các lệnh LineTo

Các chỉ dẫn _LineTo_ vẽ một đường thẳng từ _điểm hiện tại_ (_P<sub>o</sub>_; {_x<sub>o</sub>_, _y<sub>o</sub>_}) tới _điểm cuối_ (_P<sub>n</sub>_; {_x<sub>n</sub>_, _y<sub>n</sub>_}), dựa trên các tham số được chỉ định. _Điểm cuối_ (_P<sub>n</sub>_) sau đó trở thành _điểm hiện tại_ cho lệnh tiếp theo (_P<sub>o</sub>′_).

<table class="no-markdown">
  <tbody>
    <tr>
      <th scope="col">Lệnh</th>
      <th scope="col">Tham số</th>
      <th scope="col">Ghi chú</th>
    </tr>
    <tr>
      <th scope="row">L</th>
      <td>(<code>x</code>, <code>y</code>)+</td>
      <td>
        <p>
          Vẽ một đường thẳng từ <em>điểm hiện tại</em> đến
          <em>điểm cuối</em> được chỉ định bởi <code><var>x</var></code
          >,<code><var>y</var></code
          >. Mọi cặp tọa độ tiếp theo được hiểu là tham số cho các lệnh LineTo
          tuyệt đối ngầm định (<code>L</code>).
        </p>
        <p>
          <strong>Công thức:</strong> <var>P<sub>o</sub>′</var> =
          <var>P<sub>n</sub></var> = {<code><var>x</var></code
          >, <code><var>y</var></code
          >}
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">l</th>
      <td>
        (<code><var>dx</var></code
        >, <code><var>dy</var></code
        >)+
      </td>
      <td>
        <p>
          Vẽ một đường thẳng từ <em>điểm hiện tại</em> đến
          <em>điểm cuối</em> được xác định bởi dịch chuyển tương đối từ
          <code><var>dx</var></code> theo trục x và
          <code><var>dy</var></code> theo trục y. Mọi cặp tọa độ tiếp theo được
          hiểu là tham số cho các lệnh LineTo tương đối ngầm định
          (<code>l</code>).
        </p>
        <p>
          <strong>Công thức:</strong> <var>P<sub>o</sub>′</var> =
          <var>P<sub>n</sub></var> = {<var>x<sub>o</sub></var> +
          <code><var>dx</var></code
          >, <var>y<sub>o</sub></var> +
          <code><var>dy</var></code>}
        </p>
      </td>
    </tr>
  </tbody>
</table>

#### Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <path fill="none" stroke="red" d="M10 10 L90 10 L90 90 L10 90 Z" />
</svg>
```

{{EmbedLiveSample('LineTo_path_commands', '100%', 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [SVG animation with SMIL](/en-US/docs/Web/SVG/Guides/SVG_animation_with_SMIL)
