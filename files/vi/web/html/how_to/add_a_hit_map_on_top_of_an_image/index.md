---
title: Add a hitmap on top of an image
slug: Web/HTML/How_to/Add_a_hit_map_on_top_of_an_image
page-type: how-to
sidebar: htmlsidebar
---

Bạn có thể tạo image map có thể nhấp trong HTML bằng cách sử dụng các phần tử {{htmlelement('area')}} và {{htmlelement('map')}}.
Bài viết này mô tả cách thiết lập image map và một số nhược điểm cần xem xét trước khi bạn tạo một cái.

<table>
<caption>Đây là một số điều bạn cần biết</caption>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Bạn đã biết cách <a href="/en-US/docs/Learn_web_development/Getting_started/Your_first_website">tạo một tài liệu HTML cơ bản</a> và cách <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_images#how_do_we_put_an_image_on_a_webpage">thêm hình ảnh có thể truy cập vào trang web.</a>
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu cách làm cho các vùng khác nhau của một hình ảnh liên kết đến các trang khác nhau.
      </td>
    </tr>
  </tbody>
</table>

> [!WARNING]
> Bài viết này chỉ thảo luận về image map phía client. Không sử dụng image map phía server, yêu cầu người dùng phải có chuột.

## Image map và nhược điểm của chúng

Khi bạn lồng một hình ảnh bên trong {{htmlelement('a')}}, toàn bộ hình ảnh liên kết đến một trang web. Mặt khác, một image map chứa nhiều vùng hoạt động (gọi là "hotspots") mỗi vùng liên kết đến một tài nguyên khác nhau.

Trước đây, image map là một thiết bị điều hướng phổ biến, nhưng điều quan trọng là phải xem xét kỹ lưỡng các hệ quả về hiệu suất và khả năng tiếp cận của chúng.

> [!WARNING]
> Nhiều hình ảnh tham chiếu đến cùng một image map có thể dẫn đến hành vi trình duyệt không mong đợi, làm giảm đáng kể khả năng sử dụng và khả năng tiếp cận. Ví dụ, khi người dùng điều hướng bàn phím trên một hình ảnh với image map được sử dụng lại trong Safari và các trình duyệt dựa trên Chromium, các phiên bản hình ảnh sau sử dụng cùng image map đó sẽ bị bỏ qua hoàn toàn. Trong Firefox, tất cả các image map đều nhận được focus bàn phím đồng thời và khi người dùng điều hướng bàn phím qua hình ảnh, phần tử tiếp theo được focus là phần tử sau phiên bản hình ảnh cuối cùng, bỏ qua hiệu quả mọi thứ giữa hai hình ảnh.

[Liên kết văn bản](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links) (có thể được tạo kiểu với CSS) được ưa thích hơn image map vì một số lý do: liên kết văn bản nhẹ hơn, dễ bảo trì hơn, thường thân thiện với SEO hơn và hỗ trợ nhu cầu về khả năng tiếp cận (ví dụ, trình đọc màn hình, trình duyệt chỉ văn bản, dịch vụ dịch thuật).

## Cách chèn image map đúng cách

### Bước 1: Hình ảnh

Không phải hình ảnh nào cũng phù hợp.

- Hình ảnh phải làm rõ điều gì xảy ra khi mọi người nhấp vào các liên kết hình ảnh. Văn bản `alt` là bắt buộc, tất nhiên, nhưng nhiều người không bao giờ thấy nó.
- Hình ảnh phải chỉ ra rõ ràng nơi hotspot bắt đầu và kết thúc.
- Hotspot phải đủ lớn để chạm thoải mái, ở bất kỳ kích thước viewport nào. Bao lớn là đủ lớn? [72 × 72 CSS pixel là mức tối thiểu tốt,](https://uxmovement.com/mobile/finger-friendly-design-ideal-mobile-touch-target-sizes/) với các khoảng cách rộng rãi bổ sung giữa các mục tiêu chạm. Bản đồ thế giới tại [50languages.com](https://www.goethe-verlag.com/book2/) (tính đến thời điểm viết) minh họa hoàn hảo vấn đề này. Nhấn vào Nga hoặc Bắc Mỹ dễ dàng hơn nhiều so với Albania hoặc Estonia.

Bạn chèn hình ảnh của mình [theo cách tương tự như thường lệ](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_images#how_do_we_put_an_image_on_a_webpage) (với phần tử {{htmlelement("img")}} và văn bản [`alt`](/en-US/docs/Web/HTML/Reference/Elements/img#alt)). Nếu hình ảnh chỉ hiển thị như một thiết bị điều hướng, bạn có thể viết `alt=""`, miễn là bạn cung cấp văn bản [`alt`](/en-US/docs/Web/HTML/Reference/Elements/area#alt) thích hợp trong các phần tử {{htmlelement('area')}} sau đó.

Bạn sẽ cần một thuộc tính đặc biệt [`usemap`](/en-US/docs/Web/HTML/Reference/Elements/img#usemap). Hãy nghĩ ra một tên duy nhất, không chứa khoảng trắng, cho image map của bạn. Sau đó gán tên đó (được đứng trước bởi dấu thăng) làm giá trị cho thuộc tính `usemap`:

```html
<img src="image-map.png" alt="" usemap="#example-map-1" />
```

### Bước 2: Kích hoạt hotspot của bạn

Trong bước này, đặt tất cả mã của bạn bên trong một phần tử {{htmlelement('map')}}. `<map>` chỉ cần một thuộc tính, cùng [`name`](/en-US/docs/Web/HTML/Reference/Elements/map#name) map mà bạn đã sử dụng trong thuộc tính `usemap` ở trên:

```html
<map name="example-map-1"> </map>
```

Bên trong phần tử `<map>`, chúng ta cần các phần tử {{htmlelement('area')}}. Một phần tử `<area>` tương ứng với một hotspot duy nhất. Để điều hướng bàn phím trực quan, hãy đảm bảo thứ tự nguồn của các phần tử `<area>` tương ứng với thứ tự trực quan của các hotspot.

Các phần tử `<area>` là {{glossary("void element", "void elements")}}, nhưng yêu cầu bốn thuộc tính:

- [`shape`](/en-US/docs/Web/HTML/Reference/Elements/area#shape)
  - : Thuộc tính `shape` nhận một trong bốn giá trị: `circle`, `rect`, `poly`, và `default`. Một `<area>` có `shape` là `default` chiếm toàn bộ hình ảnh, trừ bất kỳ hotspot nào khác bạn đã xác định.
    Nếu có bất kỳ chồng lấp nào giữa các khu vực được xác định, thứ tự nguồn xác định khu vực nào được ưu tiên.
    Hình dạng bạn chọn xác định thông tin tọa độ bạn cần cung cấp trong `coords`.

- [`coords`](/en-US/docs/Web/HTML/Reference/Elements/area#coords)
  - : Tọa độ được đưa ra bằng CSS pixel, và giá trị của nó phụ thuộc vào `shape` được chọn.
    - Đối với hình tròn, cung cấp tọa độ x và y của tâm, theo sau là độ dài bán kính.
    - Đối với hình chữ nhật, cung cấp tọa độ x và y của các góc trên-trái và dưới-phải.
    - Đối với đa giác, cung cấp tọa độ x và y của mỗi góc (vì vậy, ít nhất sáu giá trị).

- [`href`](/en-US/docs/Web/HTML/Reference/Elements/area#href)
  - : URL của tài nguyên bạn đang liên kết đến. Bạn có thể để trống thuộc tính này nếu bạn _không_ muốn khu vực hiện tại liên kết đến bất kỳ đâu (ví dụ, nếu bạn đang tạo một vòng tròn rỗng.)

- [`alt`](/en-US/docs/Web/HTML/Reference/Elements/area#alt)
  - : Một thuộc tính bắt buộc, cho mọi người biết liên kết đi đến đâu hoặc làm gì. Văn bản `alt` chỉ hiển thị khi hình ảnh không khả dụng. Vui lòng tham khảo [hướng dẫn của chúng tôi để viết văn bản liên kết có thể truy cập](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links#use_clear_link_wording).

    Bạn có thể viết `alt=""` nếu thuộc tính `href` trống _và_ toàn bộ hình ảnh đã có thuộc tính `alt`.

```html
<map name="example-map-1">
  <area
    shape="circle"
    coords="200,250,25"
    href="page-2.html"
    alt="circle example" />

  <area
    shape="rect"
    coords="10, 5, 20, 15"
    href="page-3.html"
    alt="rectangle example" />
</map>
```

### Bước 3: Đảm bảo nó hoạt động cho tất cả mọi người

Bạn chưa xong cho đến khi bạn kiểm tra image map kỹ lưỡng trên nhiều trình duyệt và thiết bị. Hãy thử nhấp vào các liên kết chỉ bằng bàn phím. Hãy thử tắt hình ảnh.

Nếu image map của bạn rộng hơn khoảng 240px, bạn sẽ cần thực hiện các điều chỉnh thêm để làm cho trang web của bạn responsive. Việc chỉ thay đổi kích thước hình ảnh cho màn hình nhỏ là không đủ, vì các tọa độ vẫn giữ nguyên và không còn khớp với hình ảnh nữa.

## Tìm hiểu thêm

- {{htmlelement("img")}}
- {{htmlelement("map")}}
- {{htmlelement("area")}}
- [Trình chỉnh sửa image map trực tuyến](https://www.maschek.hu/imagemap/)
