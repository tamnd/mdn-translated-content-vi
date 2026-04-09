---
title: Mẫu
slug: Web/SVG/Tutorials/SVG_from_scratch/Patterns
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Gradients", "Web/SVG/Tutorials/SVG_from_scratch/Texts") }}

## Mẫu

Patterns có lẽ là một trong những kiểu fill khó dùng hơn trong SVG. Chúng cũng rất mạnh, nên rất đáng để nói tới và nắm được ít nhất là cách dùng cơ bản. Giống như gradient, phần tử {{SVGElement('pattern')}} nên được đặt trong phần {{SVGElement("defs")}} của tệp SVG.

```html
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <linearGradient id="Gradient1">
      <stop offset="5%" stop-color="white" />
      <stop offset="95%" stop-color="blue" />
    </linearGradient>
    <linearGradient id="Gradient2" x1="0" x2="0" y1="0" y2="1">
      <stop offset="5%" stop-color="red" />
      <stop offset="95%" stop-color="orange" />
    </linearGradient>

    <pattern id="Pattern" x="0" y="0" width=".25" height=".25">
      <rect x="0" y="0" width="50" height="50" fill="skyblue" />
      <rect x="0" y="0" width="25" height="25" fill="url(#Gradient2)" />
      <circle
        cx="25"
        cy="25"
        r="20"
        fill="url(#Gradient1)"
        fill-opacity="0.5" />
    </pattern>
  </defs>

  <rect fill="url(#Pattern)" stroke="black" width="200" height="200" />
</svg>
```

{{ EmbedLiveSample('Patterns','220','240') }}

Bên trong phần tử {{SVGElement("pattern")}}, bạn có thể đưa vào bất kỳ hình cơ bản nào đã dùng trước đó, và mỗi hình trong số đó đều có thể được tạo kiểu bằng bất kỳ kiểu nào bạn đã học trước đó, bao gồm gradient và độ mờ. Ở đây, chúng ta chỉ vẽ hai phần tử rectangle bên trong pattern (chồng lên nhau, và một trong số đó có kích thước gấp đôi cái còn lại và được dùng để lấp đầy toàn bộ pattern), và một hình tròn.

Điều gây khó hiểu ở patterns là việc định nghĩa một hệ đơn vị và kích thước của chúng. Trong ví dụ trên, chúng ta đã định nghĩa các thuộc tính `width` và `height` trên phần tử pattern để mô tả pattern sẽ đi bao xa trước khi bắt đầu lặp lại. Cũng có các thuộc tính `x` và `y` nếu bạn muốn dịch điểm bắt đầu của hình chữ nhật này tới một vị trí nào đó trong bản vẽ. Lý do chúng được dùng ở đây sẽ được mô tả bên dưới.

Giống như thuộc tính `gradientUnits` đã dùng ở trên, patterns cũng có một thuộc tính là `patternUnits`, chỉ định hệ đơn vị mà các thuộc tính này sẽ dùng. Mặc định của nó là `"objectBoundingBox"` như ở trên, nên giá trị `1` sẽ được co giãn theo `width` và `height` của đối tượng mà bạn đang áp dụng pattern lên. Vì trong trường hợp này chúng ta muốn pattern lặp lại 4 lần theo chiều ngang và chiều dọc, nên `height` và `width` được đặt thành `0.25`. Điều này có nghĩa là `width` và `height` của pattern chỉ bằng `0.25` tổng kích thước hộp.

Khác với gradient, patterns có thuộc tính thứ hai là `patternContentUnits`, mô tả hệ đơn vị được dùng bên trong phần tử pattern, trên chính các hình cơ bản. Thuộc tính này mặc định là `"userSpaceOnUse"`, ngược lại với thuộc tính `patternUnits`. Điều này có nghĩa là trừ khi bạn chỉ định một hoặc cả hai thuộc tính này (`patternContentUnits` và `patternUnits`), các hình bạn vẽ bên trong pattern sẽ được vẽ trong hệ tọa độ khác với hệ mà phần tử pattern đang dùng, điều này có thể khiến mọi thứ hơi rối khi bạn viết tay.

Để làm cho ví dụ trên hoạt động, chúng ta phải xét kích thước của hộp (200 pixel) và thực tế là chúng ta muốn pattern lặp lại 4 lần theo chiều ngang và chiều dọc. Điều này có nghĩa là mỗi đơn vị pattern là một ô vuông 50×50. Hai hình chữ nhật và hình tròn bên trong pattern sau đó được đặt kích thước để vừa với một hộp 50×50. Bất cứ thứ gì chúng ta vẽ ra ngoài hộp đó sẽ không được hiển thị. Pattern cũng phải được dịch 10 pixel để nó bắt đầu ở góc trên bên trái của hộp, nên các thuộc tính `x` và `y` của pattern phải được điều chỉnh thành 10÷200 = 0.05.

Điều cần lưu ý ở đây là nếu đối tượng thay đổi kích thước, chính pattern sẽ co giãn để vừa với nó, nhưng các đối tượng bên trong sẽ không. Vì vậy, mặc dù chúng ta vẫn sẽ có 4 đơn vị lặp trong pattern, các đối tượng cấu thành pattern đó sẽ giữ nguyên kích thước, và bạn sẽ nhận được những vùng trống lớn ở giữa chúng. Bằng cách thay đổi thuộc tính `patternContentUnits`, chúng ta có thể đưa tất cả các phần tử vào cùng một hệ đơn vị:

```xml
 <pattern id="Pattern" width=".25" height=".25" patternContentUnits="objectBoundingBox">
   <rect x="0" y="0" width=".25" height=".25" fill="skyblue"/>
   <rect x="0" y="0" width=".125" height=".125" fill="url(#Gradient2)"/>
   <circle cx=".125" cy=".125" r=".1" fill="url(#Gradient1)" fill-opacity="0.5"/>
 </pattern>
```

Giờ đây, vì nội dung của pattern ở cùng hệ đơn vị với pattern, chúng ta không cần dịch hộp để pattern bắt đầu ở đúng vị trí, và nếu kích thước đối tượng thay đổi thành lớn hơn, pattern sẽ tự động co giãn để có cùng số lượng đối tượng và số lần lặp bên trong nó. Điều này tương phản với hệ `"userSpaceOnUse"`, nơi nếu đối tượng đổi kích thước, pattern sẽ giữ nguyên và chỉ lặp lại nhiều lần hơn để lấp đầy hộp.

Lưu ý thêm, trong Gecko, các hình tròn dường như gặp khó khăn khi vẽ nếu bán kính của chúng được đặt nhỏ hơn `0.075` (hiện chưa rõ đây có phải là lỗi trong phần tử pattern hay không). Để tránh điều đó, có lẽ tốt nhất là đừng vẽ bằng đơn vị `"objectBoundingBox"` trừ khi bạn buộc phải làm vậy.

Không cách dùng nào trong số này là thứ người ta thường nghĩ tới khi nhắc đến pattern. Pattern thường có kích thước cố định và tự lặp lại độc lập với hình dạng của đối tượng. Để tạo ra thứ như vậy, cả pattern lẫn nội dung của nó phải được vẽ trong userSpace hiện tại, để chúng không đổi hình dạng khi đối tượng thay đổi:

```xml
 <pattern id="Pattern" x="10" y="10" width="50" height="50" patternUnits="userSpaceOnUse">
   <rect x="0" y="0" width="50" height="50" fill="skyblue"/>
   <rect x="0" y="0" width="25" height="25" fill="url(#Gradient2)"/>
   <circle cx="25" cy="25" r="20" fill="url(#Gradient1)" fill-opacity="0.5"/>
 </pattern>
```

Dĩ nhiên, điều này có nghĩa là pattern sẽ không co giãn nếu sau đó bạn thay đổi kích thước đối tượng. Cả ba ví dụ trước đều được hiển thị bên dưới trên một hình chữ nhật đã được kéo dài nhẹ tới `height` `300px`, nhưng tôi nên lưu ý rằng đây không phải là bức tranh toàn diện, và còn có các tùy chọn khác tùy thuộc vào ứng dụng của bạn.

![Ba ví dụ hiển thị các giá trị patternUnits mặc định và userSpaceOnUse cùng các giá trị patternContentUnits mặc định và objectBoundingBox. Khi cả hai đều để mặc định, tỷ lệ được giữ nguyên với phần trắng còn thấy được. Đặt patternContentUnits thành objectBoundingBox ảnh hưởng tỷ lệ để loại bỏ khoảng trắng. Đặt patternUnits thành userSpaceOnUse giữ tỷ lệ trong khi loại bỏ khoảng trắng.](svg_pattern_comparison_of_units.png)

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Gradients", "Web/SVG/Tutorials/SVG_from_scratch/Texts") }}
