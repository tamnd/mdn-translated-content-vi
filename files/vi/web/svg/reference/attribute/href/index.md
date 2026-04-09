---
title: href
slug: Web/SVG/Reference/Attribute/href
page-type: svg-attribute
browser-compat:
  - svg.elements.a.href
  - svg.elements.animate.href
  - svg.elements.animateMotion.href
  - svg.elements.animateTransform.href
  - svg.elements.feImage.href
  - svg.elements.image.href
  - svg.elements.linearGradient.href
  - svg.elements.mpath.href
  - svg.elements.pattern.href
  - svg.elements.radialGradient.href
  - svg.elements.script.href
  - svg.elements.set.href
  - svg.elements.textPath.href
  - svg.elements.use.href
sidebar: svgref
---

Thuộc tính **`href`** định nghĩa một liên kết tới tài nguyên dưới dạng một [URL](/en-US/docs/Web/SVG/Guides/Content_type#url) tham chiếu. Ý nghĩa chính xác của liên kết đó phụ thuộc vào ngữ cảnh của từng phần tử sử dụng nó.

> [!NOTE]
> Các đặc tả trước SVG 2 định nghĩa thuộc tính {{SVGAttr("xlink:href")}}, hiện nay đã bị `href` thay thế và làm lỗi thời. Nếu bạn cần hỗ trợ các phiên bản trình duyệt cũ hơn, thuộc tính `xlink:href` đã bị loại bỏ có thể được dùng như một phương án dự phòng cùng với thuộc tính `href`, ví dụ: `<use href="some-id" xlink:href="some-id" x="5" y="5" />`.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("a")}}
- {{SVGElement("animate")}}
- {{SVGElement("animateMotion")}}
- {{SVGElement("animateTransform")}}
- {{SVGElement("feImage")}}
- {{SVGElement("image")}}
- {{SVGElement("linearGradient")}}
- {{SVGElement("mpath")}}
- {{SVGElement("pattern")}}
- {{SVGElement("radialGradient")}}
- {{SVGElement("script")}}
- {{SVGElement("set")}}
- {{SVGElement("textPath")}}
- {{SVGElement("use")}}

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 160 40" xmlns="http://www.w3.org/2000/svg">
  <a href="https://developer.mozilla.org/">
    <text x="10" y="25">MDN Web Docs</text>
  </a>
</svg>
```

{{EmbedLiveSample("Example", "320", "100")}}

## Trong SVG

### a

Với {{SVGElement("a")}}, `href` định nghĩa vị trí của đối tượng được tham chiếu, được biểu diễn như một URL reference.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#url">&#x3C;url></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

### animate, animateMotion, animateTransform, set

Với các phần tử {{SVGElement("animate")}}, {{SVGElement("animateMotion")}}, {{SVGElement("animateTransform")}}, và {{SVGElement("set")}}, `href` định nghĩa một URL tham chiếu tới phần tử là đích của phần tử hoạt ảnh này và do đó sẽ bị sửa đổi theo thời gian.

URL phải trỏ tới đúng một phần tử đích có thể là đích của phần tử hoạt ảnh đã cho. Nếu URL trỏ tới nhiều phần tử đích, nếu phần tử đích đã cho không thể là đích của phần tử hoạt ảnh đã cho, hoặc nếu phần tử đích đã cho không thuộc tài liệu hiện tại, thì phần tử hoạt ảnh sẽ không ảnh hưởng tới bất kỳ phần tử đích nào. Tuy nhiên, phần tử hoạt ảnh vẫn sẽ hoạt động bình thường đối với các thuộc tính thời gian của nó. Cụ thể, các TimeEvents vẫn được phát đi và phần tử hoạt ảnh có thể được dùng làm syncbase theo cách giống hệt như khi URL tham chiếu tới một phần tử đích hợp lệ.

Nếu thuộc tính `href` hoặc thuộc tính {{SVGAttr("xlink:href")}} đã bị loại bỏ không được cung cấp, thì phần tử đích sẽ là phần tử cha trực tiếp của phần tử hoạt ảnh hiện tại. Nếu cả `xlink:href` và `href` đều được chỉ định, giá trị của thuộc tính sau sẽ được dùng.

Tham khảo mô tả của từng phần tử hoạt ảnh riêng lẻ để biết mọi hạn chế về loại phần tử nào có thể là đích của những loại hoạt ảnh cụ thể.

Ngoại trừ mọi quy tắc cụ thể SVG được nêu rõ trong đặc tả này, định nghĩa chuẩn cho thuộc tính này là đặc tả Hoạt ảnh {{Glossary("SMIL")}}. Cụ thể, xem [SMIL Animation: Specifying the animation target](https://www.w3.org/TR/smil-animation/#SpecifyingAnimationTarget).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#url">&#x3C;url></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

### feImage

Với {{SVGElement("feImage")}}, `href` định nghĩa một URL tham chiếu tới tài nguyên hình ảnh hoặc tới một phần tử. Nếu cả {{SVGAttr("xlink:href")}} và thuộc tính `href` đều được chỉ định, thuộc tính sau sẽ ghi đè thuộc tính trước.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#url">&#x3C;url></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

### image

Với {{SVGElement("image")}}, `href` định nghĩa một URL tham chiếu tới hình ảnh cần hiển thị.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#url">&#x3C;url></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <image href="fxlogo.png" x="0" y="0" height="100" width="100" />
</svg>
```

{{EmbedLiveSample("image", 200, 250)}}

### linearGradient/radialGradient

Với {{SVGElement("linearGradient")}} hoặc {{SVGElement("radialGradient")}}, `href` định nghĩa một URL tham chiếu tới phần tử gradient mẫu; để hợp lệ, tham chiếu phải trỏ tới một phần tử `<linearGradient>` hoặc `<radialGradient>` khác.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#url">&#x3C;url></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

### mpath

Với {{SVGElement("mpath")}}, `href` định nghĩa một URL tham chiếu tới phần tử {{SVGElement("path")}} hoặc [basic shape](/en-US/docs/Web/CSS/Guides/Shapes/Using_shape-outside) xác định motion path.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#url">&#x3C;url></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

### pattern

Với {{SVGElement("pattern")}}, `href` định nghĩa một URL tham chiếu tới một phần tử `<pattern>` khác trong tài liệu SVG hiện tại. Bất kỳ thuộc tính nào được định nghĩa trên phần tử được tham chiếu mà không được định nghĩa trên phần tử này sẽ được kế thừa bởi phần tử này. Nếu phần tử này không có phần tử con nào, và phần tử được tham chiếu có (có thể là do chính thuộc tính `href` của nó), thì phần tử này sẽ kế thừa các phần tử con từ phần tử được tham chiếu. Việc kế thừa có thể gián tiếp ở mọi mức độ; do đó, nếu phần tử được tham chiếu kế thừa thuộc tính hoặc phần tử con do chính thuộc tính `href` của nó, thì phần tử hiện tại cũng có thể kế thừa các thuộc tính hoặc phần tử con đó. Trên phần tử {{SVGElement("pattern")}}, thuộc tính `href` có thể hoạt ảnh.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#url">&#x3C;url></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

### script

Với {{SVGElement("script")}}, `href` định nghĩa một URL tham chiếu tới tài nguyên bên ngoài chứa mã script.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#url">&#x3C;url></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

### textPath

Với {{SVGElement("textPath")}}, `href` định nghĩa một URL tham chiếu tới phần tử {{SVGElement("path")}} hoặc [basic shape](/en-US/docs/Web/CSS/Guides/Shapes/Using_shape-outside) mà văn bản sẽ được hiển thị lên đó nếu không cung cấp thuộc tính {{SVGAttr("path")}}. Trên phần tử {{SVGElement("textPath")}}, thuộc tính `href` có thể hoạt ảnh.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#url">&#x3C;url></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

### use

Với {{SVGElement("use")}}, `href` định nghĩa một URL tham chiếu tới một phần tử hoặc fragment bên trong tài liệu SVG để được sao chép.

Phần tử `<use>` có thể tham chiếu tới toàn bộ tài liệu SVG bằng cách chỉ định giá trị `href` không có fragment. Những tham chiếu như vậy được hiểu là đang tham chiếu tới phần tử gốc của tài liệu được tham chiếu.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#url">&#x3C;url></a></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{SVGAttr("xlink:href")}}
