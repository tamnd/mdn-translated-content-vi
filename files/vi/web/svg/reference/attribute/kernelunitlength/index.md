---
title: kernelUnitLength
slug: Web/SVG/Reference/Attribute/kernelUnitLength
page-type: svg-attribute
spec-urls:
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fespecularlighting-kernelunitlength
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-fediffuselighting-kernelunitlength
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-feconvolvematrix-kernelunitlength
sidebar: svgref
---

Thuộc tính **`kernelUnitLength`** có hai nghĩa tùy theo ngữ cảnh nó được dùng. Với các primitive bộ lọc ánh sáng, nó chỉ ra khoảng cách dự định cho tọa độ x và y; với {{SVGElement("feConvolveMatrix")}}, nó chỉ ra khoảng cách dự định giữa các cột và hàng liên tiếp trong kernel matrix.

Bạn có thể dùng thuộc tính này với các phần tử SVG sau:

- {{SVGElement("feConvolveMatrix")}}
- {{SVGElement("feDiffuseLighting")}}
- {{SVGElement("feSpecularLighting")}}

## feConvolveMatrix

Với {{SVGElement("feConvolveMatrix")}}, `kernelUnitLength` chỉ ra khoảng cách dự định trong các filter unit hiện tại (tức là các đơn vị được xác định bởi giá trị thuộc tính {{SVGAttr("primitiveUnits")}}) giữa các cột và hàng liên tiếp trong {{SVGAttr("kernelMatrix")}}, tương ứng. Bằng cách chỉ định giá trị cho `kernelUnitLength`, kernel trở thành một hệ tọa độ trừu tượng có thể co giãn. Nếu thuộc tính không được chỉ định, giá trị mặc định là một pixel trong bitmap ngoài màn hình, vốn là một hệ tọa độ dựa trên pixel, và vì vậy có khả năng không co giãn được.

Nếu chỉ định giá trị âm hoặc bằng không, giá trị mặc định sẽ được dùng thay thế.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number-optional-number"
            >&#x3C;number-optional-number></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Pixel trong bitmap ngoài màn hình</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

- `<number-optional-number>`
  - : Số đầu tiên là giá trị x. Số thứ hai là giá trị y. Nếu không chỉ định giá trị x, nó mặc định bằng chính giá trị x.

## feDiffuseLighting

Với {{SVGElement("feDiffuseLighting")}}, `kernelUnitLength` chỉ ra khoảng cách dự định trong các filter unit hiện tại (tức là các đơn vị được xác định bởi giá trị của thuộc tính {{SVGAttr("primitiveUnits")}}) cho tọa độ x và y tương ứng trong các công thức tính normal bề mặt.

Số đầu tiên là giá trị x. Số thứ hai là giá trị y. Nếu không chỉ định giá trị y, nó mặc định bằng giá trị x. Bằng cách chỉ định giá trị cho `kernelUnitLength`, kernel trở thành một hệ tọa độ trừu tượng có thể co giãn. Nếu thuộc tính không được chỉ định, giá trị x và y biểu diễn những độ lệch rất nhỏ tương đối với một vị trí cho trước, trong một số trường hợp có thể được triển khai như một pixel trong bitmap ngoài màn hình của ảnh trung gian, vốn là một hệ tọa độ dựa trên pixel và vì vậy có khả năng không co giãn được.

Nếu chỉ định giá trị âm hoặc bằng không, giá trị mặc định sẽ được dùng thay thế.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number-optional-number"
            >&#x3C;number-optional-number></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Pixel trong bitmap ngoài màn hình</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## feSpecularLighting

Với {{SVGElement("feSpecularLighting")}}, `kernelUnitLength` chỉ ra khoảng cách dự định trong các filter unit hiện tại (tức là các đơn vị được xác định bởi giá trị của thuộc tính {{SVGAttr("primitiveUnits")}}) cho tọa độ x và y tương ứng trong các công thức tính normal bề mặt.

Số đầu tiên là giá trị x. Số thứ hai là giá trị y. Nếu không chỉ định giá trị y, nó mặc định bằng giá trị x. Bằng cách chỉ định giá trị cho `kernelUnitLength`, kernel trở thành một hệ tọa độ trừu tượng có thể co giãn. Nếu thuộc tính không được chỉ định, giá trị x và y biểu diễn những độ lệch rất nhỏ tương đối với một vị trí cho trước, trong một số trường hợp có thể được triển khai như một pixel trong bitmap ngoài màn hình của ảnh trung gian, vốn là một hệ tọa độ dựa trên pixel và vì vậy có khả năng không co giãn được.

Nếu chỉ định giá trị âm hoặc bằng không, giá trị mặc định sẽ được dùng thay thế.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/SVG/Guides/Content_type#number-optional-number"
            >&#x3C;number-optional-number></a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Pixel trong bitmap ngoài màn hình</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể animate</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}
