---
title: Gradient trong SVG
slug: Web/SVG/Tutorials/SVG_from_scratch/Gradients
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Fills_and_strokes", "Web/SVG/Tutorials/SVG_from_scratch/Patterns") }}

Có lẽ còn thú vị hơn cả fill và stroke là việc bạn cũng có thể tạo và áp dụng gradient làm fill hoặc stroke.

Có hai loại SVG gradient: linear và radial. Chúng được định nghĩa tách biệt với nơi chúng được dùng, điều này giúp tái sử dụng tốt hơn. Bạn **phải** gán cho mỗi gradient một thuộc tính `id` để cho các phần tử khác tham chiếu tới nó. Các định nghĩa gradient có thể được đặt trong một phần tử {{SVGElement('defs')}} hoặc một phần tử {{SVGElement('svg')}}.

## Linear Gradient

Linear gradient thay đổi dọc theo một đường thẳng. Để chèn một gradient như vậy, bạn tạo một nút {{SVGElement('linearGradient')}} bên trong phần `<defs>` của tệp SVG.

### Ví dụ cơ bản

```html
<svg width="120" height="240" version="1.1" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="Gradient1">
      <stop class="stop1" offset="0%" />
      <stop class="stop2" offset="50%" />
      <stop class="stop3" offset="100%" />
    </linearGradient>
    <linearGradient id="Gradient2" x1="0" x2="0" y1="0" y2="1">
      <stop offset="0%" stop-color="red" />
      <stop offset="50%" stop-color="black" stop-opacity="0" />
      <stop offset="100%" stop-color="blue" />
    </linearGradient>
  </defs>
  <style>
    #rect1 {
      fill: url("#Gradient1");
    }
    .stop1 {
      stop-color: red;
    }
    .stop2 {
      stop-color: black;
      stop-opacity: 0;
    }
    .stop3 {
      stop-color: blue;
    }
  </style>

  <rect id="rect1" x="10" y="10" rx="15" ry="15" width="100" height="100" />
  <rect
    x="10"
    y="120"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#Gradient2)" />
</svg>
```

{{ EmbedLiveSample('Linear_Gradient','120','280') }}

Trên đây là một ví dụ linear gradient được áp dụng cho một phần tử `<rect>`. Bên trong linear gradient có nhiều nút {{SVGElement('stop')}}. Các nút này cho gradient biết nó nên có màu gì ở những vị trí nhất định bằng cách chỉ định thuộc tính `offset` cho vị trí, và thuộc tính `stop-color`. Giá trị này có thể được gán trực tiếp hoặc thông qua CSS. Hai cách này đã được trộn lẫn trong ví dụ này. Chẳng hạn, stop này cho gradient bắt đầu bằng màu đỏ, chuyển sang đen trong suốt ở giữa, và kết thúc bằng màu xanh dương. Bạn có thể chèn bao nhiêu stop màu tùy thích để tạo một dải màu đẹp hoặc xấu tùy nhu cầu, nhưng các offset luôn phải tăng từ 0% (hoặc 0 nếu bạn muốn bỏ dấu %) tới 100% (hoặc 1). Các giá trị trùng nhau sẽ dùng stop được gán thấp hơn trong cây XML. Ngoài ra, giống như với fill và stroke, bạn có thể chỉ định thuộc tính `stop-opacity` để đặt độ mờ tại vị trí đó (một lần nữa, trong FF3 bạn cũng có thể dùng giá trị rgba để làm việc này).

```svg
<stop offset="100%" stop-color="yellow" stop-opacity="0.5"/>
```

Để dùng một gradient, bạn phải tham chiếu nó từ thuộc tính `fill` hoặc `stroke` của một đối tượng. Việc này được thực hiện giống như cách bạn tham chiếu phần tử trong CSS, dùng `url`. Trong trường hợp này, url chỉ là một tham chiếu tới gradient của chúng ta, có ID khá sáng tạo là "Gradient1". Để gắn nó vào, hãy đặt `fill` thành `url("#Gradient1")`, và voilà! Đối tượng của chúng ta giờ có nhiều màu. Bạn cũng có thể làm tương tự với `stroke`.

```svg
<style>
  #rect1 {
    fill: url("#Gradient1");
  }
</style>
```

Phần tử `<linearGradient>` cũng nhận một số thuộc tính khác, chỉ định kích thước và diện mạo của gradient. Hướng của gradient được điều khiển bởi hai điểm, được chỉ định bởi các thuộc tính `x1`, `x2`, `y1`, và `y2`. Các thuộc tính này định nghĩa một đường mà gradient sẽ đi theo. Gradient mặc định có hướng ngang, nhưng có thể xoay bằng cách thay đổi chúng. Gradient2 trong ví dụ trên được thiết kế để tạo một gradient dọc.

```html
<linearGradient id="Gradient2" x1="0" x2="0" y1="0" y2="1"></linearGradient>
```

> [!NOTE]
> Bạn cũng có thể dùng thuộc tính `href` trên gradient. Khi được dùng, các thuộc tính và stop từ một gradient có thể được đưa vào gradient khác. Trong ví dụ trên, bạn không cần tạo lại tất cả các stop trong Gradient2.
>
> ```html
> <linearGradient id="Gradient1">
>   <stop id="stop1" offset="0%" />
>   <stop id="stop2" offset="50%" />
>   <stop id="stop3" offset="100%" />
> </linearGradient>
> <linearGradient
>   id="Gradient2"
>   x1="0"
>   x2="0"
>   y1="0"
>   y2="1"
>   xmlns:xlink="http://www.w3.org/1999/xlink"
>   href="#Gradient1" />
> ```
>
> Chúng tôi đã đưa namespace xlink trực tiếp trên nút ở đây, mặc dù thông thường bạn sẽ định nghĩa nó ở đầu tài liệu. Xem thêm điều đó khi chúng ta [nói về hình ảnh](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Other_content_in_SVG).

## Radial Gradient

Radial gradient tương tự linear gradient nhưng vẽ một gradient tỏa ra từ một điểm. Để tạo nó, bạn thêm một phần tử {{SVGElement('radialGradient')}} vào phần `<defs>` của tài liệu.

### Ví dụ cơ bản

```html
<?xml version="1.0" standalone="no"?>
<svg width="120" height="240" version="1.1" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient id="RadialGradient1">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
    <radialGradient id="RadialGradient2" cx="0.25" cy="0.25" r="0.25">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
  </defs>

  <rect
    x="10"
    y="10"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#RadialGradient1)" />
  <rect
    x="10"
    y="120"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#RadialGradient2)" />
</svg>
```

{{ EmbedLiveSample('Basic_example_2','120','280') }}

Các stop dùng ở đây giống như trước, nhưng giờ đối tượng sẽ đỏ ở giữa, và theo mọi hướng dần chuyển sang xanh dương ở mép. Giống như linear gradient, nút `<radialGradient>` có thể nhận một số thuộc tính để mô tả vị trí và hướng của nó. Tuy nhiên, khác với linear gradient, nó hơi phức tạp hơn. Radial gradient lại được định nghĩa bởi hai điểm, xác định nơi các mép của nó nằm. Điểm đầu tiên trong số này định nghĩa một hình tròn mà gradient kết thúc quanh đó. Nó cần một điểm tâm, được chỉ định bởi các thuộc tính `cx` và `cy`, cùng một bán kính `r`. Đặt ba thuộc tính này sẽ cho phép bạn di chuyển gradient và thay đổi kích thước của nó, như trong `rect` thứ hai ở trên.

Điểm thứ hai được gọi là focal point và được định nghĩa bởi các thuộc tính `fx` và `fy`. Trong khi điểm đầu tiên mô tả nơi các mép của gradient nằm, focal point mô tả nơi phần giữa của nó nằm. Điều này sẽ dễ thấy hơn qua một ví dụ.

### Tâm và focal point

```html
<?xml version="1.0" standalone="no"?>

<svg width="120" height="120" version="1.1" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient id="Gradient" cx="0.5" cy="0.5" r="0.5" fx="0.25" fy="0.25">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
  </defs>

  <rect
    x="10"
    y="10"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#Gradient)"
    stroke="black"
    stroke-width="2" />

  <circle
    cx="60"
    cy="60"
    r="50"
    fill="transparent"
    stroke="white"
    stroke-width="2" />
  <circle cx="35" cy="35" r="2" fill="white" stroke="white" />
  <circle cx="60" cy="60" r="2" fill="white" stroke="white" />
  <text x="38" y="40" fill="white" font-family="sans-serif" font-size="10pt">
    (fx,fy)
  </text>
  <text x="63" y="63" fill="white" font-family="sans-serif" font-size="10pt">
    (cx,cy)
  </text>
</svg>
```

{{ EmbedLiveSample('Center_and_focal_point','120','160') }}

Nếu focal point bị đẩy ra ngoài hình tròn đã mô tả trước đó, gradient sẽ không thể được hiển thị đúng, nên điểm đó sẽ được giả định là nằm trong mép của hình tròn. Nếu không chỉ định focal point, nó sẽ được giả định là trùng với điểm tâm.

Cả linear và radial gradient cũng nhận thêm một vài thuộc tính khác để mô tả các phép biến đổi mà chúng có thể trải qua. Thuộc tính khác duy nhất tôi muốn đề cập ở đây là `spreadMethod`. Thuộc tính này điều khiển điều gì xảy ra khi gradient chạm tới điểm cuối, nhưng đối tượng vẫn chưa được tô hết. Nó có thể nhận một trong ba giá trị `"pad"`, `"reflect"`, hoặc `"repeat"`. `"pad"` là những gì bạn đã thấy cho tới nay. Khi gradient chạm tới điểm cuối, màu ở offset cuối cùng được dùng để tô phần còn lại của đối tượng. `"reflect"` khiến gradient tiếp tục đi, nhưng phản chiếu ngược lại, bắt đầu với màu ở offset 100% rồi quay về offset 0%, rồi lại đi lên lần nữa. `"repeat"` cũng cho phép gradient tiếp tục, nhưng thay vì đi ngược lại, nó chỉ nhảy về đầu và chạy lại.

### spreadMethod

```html
<?xml version="1.0" standalone="no"?>

<svg width="220" height="220" version="1.1" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <radialGradient
      id="GradientPad"
      cx="0.5"
      cy="0.5"
      r="0.4"
      fx="0.75"
      fy="0.75"
      spreadMethod="pad">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
    <radialGradient
      id="GradientRepeat"
      cx="0.5"
      cy="0.5"
      r="0.4"
      fx="0.75"
      fy="0.75"
      spreadMethod="repeat">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
    <radialGradient
      id="GradientReflect"
      cx="0.5"
      cy="0.5"
      r="0.4"
      fx="0.75"
      fy="0.75"
      spreadMethod="reflect">
      <stop offset="0%" stop-color="red" />
      <stop offset="100%" stop-color="blue" />
    </radialGradient>
  </defs>

  <rect
    x="10"
    y="10"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#GradientPad)" />
  <rect
    x="10"
    y="120"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#GradientRepeat)" />
  <rect
    x="120"
    y="120"
    rx="15"
    ry="15"
    width="100"
    height="100"
    fill="url(#GradientReflect)" />

  <text x="15" y="30" fill="white" font-family="sans-serif" font-size="12pt">
    Pad
  </text>
  <text x="15" y="140" fill="white" font-family="sans-serif" font-size="12pt">
    Repeat
  </text>
  <text x="125" y="140" fill="white" font-family="sans-serif" font-size="12pt">
    Reflect
  </text>
</svg>
```

{{ EmbedLiveSample('spreadMethod','220','260') }}

Cả hai gradient cũng có một thuộc tính tên `gradientUnits`, mô tả hệ đơn vị mà bạn sẽ dùng khi mô tả kích thước hoặc hướng của gradient. Có hai giá trị có thể dùng ở đây: `"userSpaceOnUse"` hoặc `"objectBoundingBox"`. `"objectBoundingBox"` là mặc định, nên đó là những gì đã được hiển thị cho tới nay. Nó về cơ bản co giãn gradient theo kích thước của đối tượng, nên bạn chỉ cần chỉ định tọa độ theo giá trị từ 0 đến 1, và chúng sẽ tự động được co giãn theo kích thước của đối tượng. `userSpaceOnUse` về cơ bản dùng các đơn vị tuyệt đối. Vì vậy bạn phải biết đối tượng của mình nằm ở đâu, và đặt gradient ở cùng vị trí đó. RadialGradient ở trên sẽ được viết lại:

```html
<radialGradient
  id="Gradient"
  cx="60"
  cy="60"
  r="50"
  fx="35"
  fy="35"
  gradientUnits="userSpaceOnUse"></radialGradient>
```

Bạn cũng có thể áp dụng thêm một phép biến đổi khác cho gradient bằng cách dùng thuộc tính `gradientTransform`, nhưng vì chúng ta هنوز chưa [giới thiệu các phép biến đổi](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Basic_transformations), chúng ta sẽ để phần đó cho sau.

Có một vài lưu ý khác khi làm việc với `gradientUnits="objectBoundingBox"` khi bounding box của đối tượng không phải hình vuông, nhưng chúng khá phức tạp và sẽ phải đợi người hiểu rõ hơn giải thích.

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Fills_and_strokes", "Web/SVG/Tutorials/SVG_from_scratch/Patterns") }}
