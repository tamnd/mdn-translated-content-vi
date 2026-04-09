---
title: Cắt xén và che phủ
slug: Web/SVG/Tutorials/SVG_from_scratch/Clipping_and_masking
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Basic_transformations", "Web/SVG/Tutorials/SVG_from_scratch/Other_content_in_SVG") }}

Việc xóa đi một phần những gì bạn đã tạo ra thoạt nhìn có vẻ mâu thuẫn. Nhưng khi, chẳng hạn, bạn cố tạo một nửa hình tròn trong SVG, bạn sẽ nhanh chóng nhận ra tác dụng của các thuộc tính sau:

- **Clipping**, tức là loại bỏ các phần của phần tử được xác định bởi các phần khác. Trong trường hợp này, không thể có hiệu ứng nửa trong suốt; đây là cách tiếp cận hoặc là có tất cả hoặc là không có gì.

- **Masking**, ngược lại, cho phép có biên mềm bằng cách tính đến độ trong suốt và các giá trị xám của mask.

## Tạo clip

Chúng ta tạo nửa hình tròn nói trên dựa trên phần tử `circle`:

```html
<svg
  version="1.1"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <clipPath id="cut-off-bottom">
      <rect x="0" y="0" width="200" height="100" />
    </clipPath>
  </defs>

  <circle cx="100" cy="100" r="100" clip-path="url(#cut-off-bottom)" />
</svg>
```

Tâm ở (100,100), một hình tròn bán kính 100 được vẽ. Thuộc tính `clip-path` tham chiếu tới một phần tử {{ SVGElement("clipPath") }} chứa một phần tử `rect` duy nhất. Bản thân hình chữ nhật này sẽ tô nửa trên của canvas thành màu đen. Lưu ý rằng phần tử `clipPath` thường được đặt trong phần `defs`.

Tuy nhiên, phần tử `rect` sẽ không được vẽ. Thay vào đó, dữ liệu pixel của nó sẽ được dùng để xác định những pixel nào của hình tròn "đi qua" được tới lần hiển thị cuối cùng. Vì hình chữ nhật chỉ che nửa trên của hình tròn, nửa dưới của hình tròn sẽ biến mất:

{{ EmbedLiveSample('Creating_clips','240','240') }}

Giờ chúng ta có một nửa hình tròn mà không cần phải xử lý cung tròn trong các phần tử path. Với clipping, mọi path bên trong `clipPath` đều được kiểm tra và đánh giá cùng với thuộc tính stroke và biến đổi của nó. Sau đó mọi phần của đối tượng đích nằm trong vùng trong suốt của nội dung `clipPath` kết quả sẽ không được hiển thị. Màu sắc, độ mờ và những thứ tương tự không có tác dụng chừng nào chúng không làm cho các phần biến mất hoàn toàn.

## Masking

Hiệu ứng masking được thể hiện ấn tượng nhất với một gradient. Nếu bạn muốn một phần tử mờ dần rồi biến mất, bạn có thể đạt hiệu ứng này khá nhanh bằng mask.

```html
<svg
  width="200"
  height="200"
  version="1.1"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <defs>
    <linearGradient id="Gradient">
      <stop offset="0" stop-color="black" />
      <stop offset="1" stop-color="white" />
    </linearGradient>
    <mask id="Mask">
      <rect x="0" y="0" width="200" height="200" fill="url(#Gradient)" />
    </mask>
  </defs>

  <rect x="0" y="0" width="200" height="200" fill="green" />
  <rect x="0" y="0" width="200" height="200" fill="red" mask="url(#Mask)" />
</svg>
```

Bạn thấy một `rect` tô màu xanh lá ở lớp thấp nhất và phía trên là một `rect` tô màu đỏ. Phần tử sau có thuộc tính `mask` trỏ tới phần tử `mask`. Nội dung của mask là một phần tử `rect` duy nhất, được tô bằng gradient đen sang trắng. Kết quả là các pixel của hình chữ nhật đỏ dùng giá trị độ chói của nội dung mask làm giá trị alpha (độ trong suốt), và ta thấy kết quả là một gradient xanh lá sang đỏ:

{{ EmbedLiveSample('Masking','240','240') }}

## Độ trong suốt với `opacity`

Thuộc tính `opacity` cho phép bạn đặt độ trong suốt cho cả một phần tử:

```xml
<rect x="0" y="0" width="100" height="100" opacity=".5" />
```

Hình chữ nhật trên sẽ được tô với độ trong suốt một nửa. Với fill và stroke, có hai thuộc tính riêng là `fill-opacity` và `stroke-opacity`, điều khiển riêng độ mờ của từng thuộc tính đó. Lưu ý rằng stroke sẽ được vẽ lên trên phần fill. Vì vậy, nếu bạn đặt độ mờ stroke cho một phần tử mà nó cũng có fill, phần fill sẽ lộ ra ở một nửa stroke, còn ở nửa còn lại thì nền sẽ hiện ra:

```html
<svg
  width="200"
  height="200"
  version="1.1"
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <rect x="0" y="0" width="200" height="200" fill="blue" />
  <circle
    cx="100"
    cy="100"
    r="50"
    stroke="yellow"
    stroke-width="40"
    stroke-opacity=".5"
    fill="red" />
</svg>
```

{{ EmbedLiveSample('Transparency_with_opacity','240','240') }}

Trong ví dụ này, bạn thấy hình tròn đỏ trên nền xanh dương. Stroke màu vàng được đặt độ mờ 50%, dẫn tới một stroke có hai màu một cách hiệu quả.

## Dùng các kỹ thuật CSS quen thuộc

Một trong những công cụ mạnh nhất trong bộ công cụ của nhà phát triển web là `display: none`. Vì thế không có gì ngạc nhiên khi quyết định mang thuộc tính CSS này vào SVG, cùng với `visibility` và `clip` như được định nghĩa bởi CSS 2. Để hoàn nguyên một `display: none` đã đặt trước đó, điều quan trọng cần biết là giá trị ban đầu của mọi phần tử SVG là `inline`.

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Basic_transformations", "Web/SVG/Tutorials/SVG_from_scratch/Other_content_in_SVG") }}
