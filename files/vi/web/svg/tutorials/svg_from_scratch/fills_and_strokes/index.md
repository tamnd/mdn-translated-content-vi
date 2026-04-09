---
title: Fill và stroke
slug: Web/SVG/Tutorials/SVG_from_scratch/Fills_and_strokes
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Paths", "Web/SVG/Tutorials/SVG_from_scratch/Gradients") }}

Có một số cách để tô màu các hình (bao gồm việc chỉ định thuộc tính trên đối tượng), sử dụng CSS inline, một phần CSS nhúng, hoặc một tệp CSS ngoài. Phần lớn [SVG](/en-US/docs/Glossary/SVG) bạn sẽ thấy trên web dùng CSS inline, nhưng mỗi kiểu đều có ưu và nhược điểm riêng.

## Thuộc tính Fill và Stroke

### Tô màu

Có thể tô màu cơ bản bằng cách đặt hai thuộc tính trên nút: `fill` và `stroke`. Dùng `fill` sẽ đặt màu bên trong đối tượng và `stroke` sẽ đặt màu của đường vẽ xung quanh đối tượng. Bạn có thể dùng cùng các quy ước đặt tên màu CSS mà bạn dùng trong HTML, dù đó là tên màu (như `red`), giá trị rgb (như `rgb(255 0 0)`), giá trị hex, v.v.

```html
<?xml version="1.0" standalone="no"?>
<svg width="160" height="140" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <rect
    x="10"
    y="10"
    width="100"
    height="100"
    stroke="blue"
    fill="purple"
    fill-opacity="0.5"
    stroke-opacity="0.8"
    stroke-width="15" />
</svg>
```

{{EmbedLiveSample("Painting", "100%", 150)}}

Ngoài ra, bạn có thể chỉ định độ mờ của `fill` hoặc `stroke` riêng rẽ trong SVG. Điều này được điều khiển bởi các thuộc tính `fill-opacity` và `stroke-opacity`.

### Stroke

Ngoài các thuộc tính màu, còn có một vài thuộc tính khác để điều khiển cách stroke được vẽ trên một đường.

![Thuộc tính stroke-linecap thay đổi diện mạo của các đầu stroke: square thêm một đầu vuông, round cho đầu bo tròn, và butt bỏ phần đầu](svg_stroke_linecap_example.png)

```xml
<?xml version="1.0" standalone="no"?>
<svg width="160" height="140" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <line x1="40" x2="120" y1="20" y2="20" stroke="black" stroke-width="20" stroke-linecap="butt"/>
  <line x1="40" x2="120" y1="60" y2="60" stroke="black" stroke-width="20" stroke-linecap="square"/>
  <line x1="40" x2="120" y1="100" y2="100" stroke="black" stroke-width="20" stroke-linecap="round"/>
</svg>
```

Thuộc tính `stroke-width` định nghĩa độ rộng của stroke này. Các stroke được vẽ tập trung quanh path. Trong ví dụ trên, path được hiển thị màu hồng, và stroke màu đen.

Thuộc tính thứ hai ảnh hưởng đến stroke là `stroke-linecap`, được minh họa ở trên. Nó điều khiển hình dạng của các đầu đường thẳng.

Có ba giá trị có thể có cho `stroke-linecap`:

- `butt` kết thúc đường bằng một cạnh thẳng vuông góc (90 độ) với hướng của stroke và đi qua điểm cuối của nó.
- `square` về cơ bản có hình dạng tương tự, nhưng kéo stroke dài hơn một chút vượt quá path thực tế. Khoảng cách stroke đi quá path bằng nửa `stroke-width`.
- `round` tạo hiệu ứng bo tròn ở đầu stroke. Bán kính của đường cong này cũng được điều khiển bởi `stroke-width`.

Dùng `stroke-linejoin` để điều khiển cách khớp giữa hai đoạn thẳng được vẽ.

![Thuộc tính stroke-linejoin thay đổi diện mạo ở điểm nơi hai đường nối nhau, với miter tạo góc nhọn, round bo góc, và bevel tạo cạnh vát, làm phẳng góc.](svg_stroke_linejoin_example.png)

```xml
<?xml version="1.0" standalone="no"?>
<svg width="160" height="280" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <polyline points="40 60 80 20 120 60" stroke="black" stroke-width="20"
      stroke-linecap="butt" fill="none" stroke-linejoin="miter"/>

  <polyline points="40 140 80 100 120 140" stroke="black" stroke-width="20"
      stroke-linecap="round" fill="none" stroke-linejoin="round"/>

  <polyline points="40 220 80 180 120 220" stroke="black" stroke-width="20"
      stroke-linecap="square" fill="none" stroke-linejoin="bevel"/>
</svg>
```

Mỗi polyline này có hai đoạn. Khớp nơi hai đoạn gặp nhau được điều khiển bởi thuộc tính `stroke-linejoin`. Có ba giá trị có thể có cho thuộc tính này. `miter` kéo dài đường hơi vượt quá độ rộng bình thường để tạo góc vuông khi chỉ có một góc. `round` tạo một đoạn đường bo tròn. `bevel` tạo một góc mới để hỗ trợ chuyển tiếp giữa hai đoạn.

Cuối cùng, bạn cũng có thể dùng các kiểu đường đứt trên stroke bằng cách chỉ định thuộc tính `stroke-dasharray`.

![Hai đường đứt tùy chỉnh, một có các đoạn đứt cách đều và một dùng mẫu đứt dài ngắn bằng giá trị thuộc tính stroke-dasharray.](svg_stroke_dasharray_example.png)

```xml
<?xml version="1.0" standalone="no"?>
<svg width="200" height="150" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <path d="M 10 75 Q 50 10 100 75 T 190 75" stroke="black"
    stroke-linecap="round" stroke-dasharray="5,10,5" fill="none"/>
  <path d="M 10 75 L 190 75" stroke="red"
    stroke-linecap="round" stroke-width="1" stroke-dasharray="5,5" fill="none"/>
</svg>
```

Thuộc tính `stroke-dasharray` có thể nhận một chuỗi số phân tách bằng dấu phẩy và/hoặc khoảng trắng làm đối số.

Số đầu tiên chỉ định khoảng cách cho vùng tô kín, và số thứ hai chỉ định khoảng cách cho vùng không tô. Vì vậy trong ví dụ trên, path thứ hai tô 5 đơn vị pixel, với 5 đơn vị trống cho tới dấu gạch tiếp theo dài 5 đơn vị. Bạn có thể chỉ định nhiều số hơn nếu muốn một mẫu gạch phức tạp hơn. Ví dụ đầu tiên chỉ định ba số, trong trường hợp này trình kết xuất lặp các số hai lần để tạo ra một mẫu đều. Vì vậy path đầu tiên kết xuất 5 tô, 10 trống, 5 tô, rồi lặp lại để tạo 5 trống, 10 tô, 5 trống. Mẫu sau đó lặp lại.

Còn có các thuộc tính `stroke` và `fill` bổ sung, bao gồm `fill-rule`, chỉ định cách tô màu các hình tự chồng lấp; [`stroke-miterlimit`](/en-US/docs/Web/SVG/Reference/Attribute/stroke-miterlimit), xác định stroke có nên vẽ miter hay không; và [stroke-dashoffset](/en-US/docs/Web/SVG/Reference/Attribute/stroke-dashoffset), chỉ định nơi bắt đầu một dasharray trên một đường.

### Thứ tự tô màu

Thứ tự mà fill và stroke được vẽ có thể được điều khiển bằng thuộc tính [`paint-order`](/en-US/docs/Web/SVG/Reference/Attribute/paint-order).

```html
<?xml version="1.0" standalone="no"?>
<svg width="400" height="180" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <polyline
    points="40 80 80 40 120 80"
    stroke-width="15"
    stroke="black"
    fill="coral"
    paint-order="fill" />

  <polyline
    points="40 140 80 100 120 140"
    stroke-width="15"
    stroke="black"
    fill="coral"
    paint-order="stroke" />
</svg>
```

{{EmbedLiveSample("Paint order", "100%", 180)}}

Trong trường hợp hình đầu tiên, fill được vẽ trước stroke, nên stroke đen xuất hiện phía trên fill.
Trong trường hợp hình thứ hai, stroke được vẽ trước fill.

## Dùng CSS

Ngoài việc đặt thuộc tính trên các đối tượng, bạn cũng có thể dùng CSS để tạo kiểu cho fill và stroke. Không phải mọi thuộc tính đều có thể đặt qua CSS. Các thuộc tính liên quan đến painting và filling thường đều khả dụng, nên `fill`, `stroke`, `stroke-dasharray`, v.v. đều có thể được đặt theo cách này, bên cạnh các phiên bản gradient và pattern của những thứ được hiển thị bên dưới. Các thuộc tính như `width`, `height`, hoặc các lệnh {{SVGElement("path")}} không thể được đặt qua CSS. Cách tốt nhất là thử và xem cái gì khả dụng và cái gì không.

> [!NOTE]
> [Đặc tả SVG](https://svgwg.org/svg2-draft/propidx.html) phân biệt rất chặt giữa các thuộc tính là _properties_ và các thuộc tính khác. Loại trước có thể được sửa bằng CSS, loại sau thì không.

CSS có thể được chèn inline cùng phần tử thông qua thuộc tính `style`:

```xml
 <rect x="10" height="180" y="10" width="180" style="stroke: black; fill: red;"/>
```

Hoặc nó có thể được chuyển vào một phần style đặc biệt mà bạn chèn vào. Tuy nhiên, thay vì nhét phần đó vào section `<head>` như trong HTML, nó được đưa vào một vùng gọi là {{SVGElement("defs")}}.

{{SVGElement("defs")}} là viết tắt của definitions, và đây là nơi bạn có thể tạo các phần tử không xuất hiện trực tiếp trong SVG, nhưng được dùng bởi các phần tử khác.

```xml
<?xml version="1.0" standalone="no"?>
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <defs>
    <style><![CDATA[
       #MyRect {
         stroke: black;
         fill: red;
         paint-order: stroke;
       }
    ]]></style>
  </defs>
  <rect x="10" height="180" y="10" width="180" id="MyRect"/>
</svg>
```

Việc chuyển styles sang một vùng như thế này có thể giúp bạn dễ điều chỉnh thuộc tính trên các nhóm phần tử lớn hơn. Bạn cũng có thể dùng những thứ như **`:hover` pseudo class** để tạo hiệu ứng rollover:

```css
#MyRect:hover {
  stroke: black;
  fill: blue;
}
```

Bạn cũng có thể chỉ định một stylesheet ngoài cho các quy tắc CSS của mình thông qua [cú pháp XML-stylesheet thông thường](https://www.w3.org/TR/xml-stylesheet/):

```xml
<?xml version="1.0" standalone="no"?>
<?xml-stylesheet type="text/css" href="style.css"?>

<svg width="200" height="150" xmlns="http://www.w3.org/2000/svg" version="1.1">
  <rect height="10" width="10" id="MyRect"/>
</svg>
```

Trong đó `style.css` trông đại khái như sau:

```css
#MyRect {
  fill: red;
  stroke: black;
}
```

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Paths", "Web/SVG/Tutorials/SVG_from_scratch/Gradients") }}
