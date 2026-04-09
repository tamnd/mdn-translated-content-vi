---
title: Vị trí
slug: Web/SVG/Tutorials/SVG_from_scratch/Positions
page-type: tutorial-chapter
sidebar: svgref
---

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Getting_started", "Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes") }}

Trong bài viết này, chúng ta xem SVG (Scalable Vector Graphics) biểu diễn vị trí và kích thước của các đối tượng trong một ngữ cảnh vẽ như thế nào, bao gồm hệ tọa độ và ý nghĩa của phép đo "pixel" trong một ngữ cảnh có thể co giãn.

## Lưới

Với tất cả các phần tử, SVG dùng một hệ tọa độ hay hệ thống **lưới** tương tự như hệ được dùng bởi [canvas](/en-US/docs/Web/API/Canvas_API) (và rất nhiều quy trình vẽ máy tính khác). Nghĩa là, góc trên bên trái của tài liệu được xem là điểm (0,0), hay gốc tọa độ. Sau đó, các vị trí được đo bằng pixel từ góc trên bên trái, với chiều x dương sang phải và chiều y dương xuống dưới.

![Lưới tọa độ X, Y với một ô màu xanh dương ở giữa.](canvas_default_grid.png)

Lưu ý rằng điều này hơi khác so với cách bạn được học để vẽ tọa độ khi còn nhỏ (trục y bị đảo). Tuy nhiên, đây cũng là cách các phần tử trong HTML được định vị (mặc định, tài liệu LTR được xem là không phải tài liệu RTL, vốn định vị X từ phải sang trái).

### Ví dụ

Phần tử

```html
<rect x="0" y="0" width="100" height="100" />
```

định nghĩa một hình chữ nhật từ góc trên bên trái, kéo dài 100px sang phải và 100px xuống dưới.

### "Pixel" là gì?

Trong trường hợp cơ bản nhất, một pixel trong tài liệu SVG ánh xạ tới một pixel trên thiết bị đầu ra (tức là màn hình). Nhưng SVG sẽ không có chữ "Scalable" trong tên nếu không có nhiều khả năng để thay đổi hành vi này. Giống như kích thước phông tuyệt đối và tương đối trong CSS, SVG định nghĩa các đơn vị tuyệt đối (những đơn vị có định danh kích thước như "pt" hoặc "cm") và cái gọi là user unit, vốn không có định danh đó và chỉ là các số thuần.

Nếu không chỉ định gì thêm, một user unit bằng một đơn vị màn hình. Để thay đổi rõ ràng hành vi này, có vài khả năng trong SVG. Chúng ta bắt đầu với phần tử gốc `svg`:

```html
<svg width="100" height="100">…</svg>
```

Phần tử trên định nghĩa một canvas SVG 100x100px. Một user unit bằng một đơn vị màn hình.

```html
<svg width="200" height="200" viewBox="0 0 100 100">…</svg>
```

Toàn bộ canvas SVG ở đây có kích thước 200px x 200px. Tuy nhiên, thuộc tính `viewBox` định nghĩa phần của canvas đó sẽ được hiển thị. 200x200 pixel này hiển thị một vùng bắt đầu tại user unit (0,0) và trải dài 100x100 user unit sang phải và xuống dưới. Điều này thực chất phóng to vùng 100x100 unit đó và làm hình ảnh lớn lên gấp đôi.

Việc ánh xạ hiện tại (cho một phần tử đơn lẻ hoặc toàn bộ hình ảnh) từ user unit sang screen unit được gọi là **user coordinate system**. Ngoài việc co giãn, hệ tọa độ cũng có thể được xoay, nghiêng, và lật. User coordinate system mặc định ánh xạ một user pixel sang một device pixel. (Tuy nhiên, thiết bị có thể tự quyết định nó hiểu một pixel là gì.) Các chiều dài trong tệp SVG với đơn vị cụ thể, như "in" hoặc "cm", sau đó được tính theo cách để chúng trông 1:1 trong hình ảnh kết quả.

Một trích dẫn từ đặc tả SVG 1.1 minh họa điều này:

> \[...] giả sử user agent có thể xác định từ môi trường của nó rằng "1px" tương ứng với "0.2822222mm" (tức là 90dpi). Khi đó, với mọi xử lý nội dung SVG: \[...] "1cm" bằng "35.43307px" (và do đó 35.43307 user units)

{{ PreviousNext("Web/SVG/Tutorials/SVG_from_scratch/Getting_started", "Web/SVG/Tutorials/SVG_from_scratch/Basic_shapes") }}
