---
title: CSS masking
short-title: Masking
slug: Web/CSS/Guides/Masking
page-type: css-module
spec-urls: https://drafts.csswg.org/css-masking-1/
sidebar: cssref
---

Module **CSS masking** định nghĩa masking và clipping — hai thao tác đồ họa khác nhau được dùng để ẩn một phần hoặc toàn bộ các phần tử hiển thị.

**Clipping** liên quan đến việc định nghĩa một vector path, hình dạng hoặc polygon khép kín làm **clipping path**. Mọi thứ bên trong vùng clipping path vẫn hiển thị trong khi mọi thứ bên ngoài bị ẩn đi, hay còn gọi là "bị cắt". Thuộc tính {{cssxref("clip-path")}} chỉ định một {{cssxref("basic-shape")}} hoặc tham chiếu đến phần tử SVG {{SVGElement("clipPath")}} được dùng làm clipping path.

Các thuộc tính CSS **masking** được dùng để áp dụng mask cho một phần tử hoặc border của nó. Một đối tượng đồ họa sau đó được vẽ lên nền hoặc border, che hoàn toàn hoặc một phần của phần tử hoặc border của nó, tùy thuộc vào opacity hoặc luminance của mask.

Hình ảnh được dùng làm mask được chỉ định bởi thuộc tính {{cssxref("mask-image")}} hoặc {{cssxref("mask-border-source")}}. Mask được chỉ định có thể là {{cssxref("image")}}, {{cssxref("gradient")}} hoặc phần tử SVG {{SVGElement("mask")}}. Mask có thể được đặt kích thước và định vị tương tự như [hình ảnh nền và border](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders).

Clipping và masking trong CSS hoạt động theo cùng cách như trong SVG: Đầu tiên, phần tử được tạo kiểu mà không có filter effects, masking, clipping và opacity. Sau đó, bất kỳ hiệu ứng nào sẽ được áp dụng cho phần tử theo thứ tự sau: [filter effects](/en-US/docs/Web/CSS/Guides/Filter_effects), clipping, masking và opacity.

Trong khi masking cung cấp nhiều kiểm soát và tùy chọn hơn, clipping có thể hoạt động tốt hơn nếu chỉ cần một basic shape — chúng dễ interpolate hơn.

## Tham chiếu

### Thuộc tính

- {{cssxref("clip")}} {{deprecated_inline}}
- {{cssxref("clip-path")}}
- {{cssxref("clip-rule")}}
- {{cssxref("mask")}} shorthand
- {{cssxref("mask-clip")}}
- {{cssxref("mask-composite")}}
- {{cssxref("mask-image")}}
- {{cssxref("mask-mode")}}
- {{cssxref("mask-origin")}}
- {{cssxref("mask-position")}}
- {{cssxref("mask-repeat")}}
- {{cssxref("mask-size")}}
- {{cssxref("mask-type")}}
- {{cssxref("mask-border")}} shorthand
- {{cssxref("mask-border-outset")}}
- {{cssxref("mask-border-repeat")}}
- {{cssxref("mask-border-slice")}}
- {{cssxref("mask-border-source")}}
- {{cssxref("mask-border-width")}}
- {{cssxref("mask-border-mode")}}

### Kiểu dữ liệu

- [`<geometry-box>`](/en-US/docs/Web/CSS/Reference/Properties/clip-path#geometry-box)

### Hàm

- Hàm {{cssxref("basic-shape/rect","rect()")}}

### Interface

- {{domxref("SVGClipPathElement")}}
- {{domxref("SVGMaskElement")}}
  - {{domxref("SVGMaskElement.maskContentUnits")}}

## Hướng dẫn

- [Giới thiệu về CSS clipping](/en-US/docs/Web/CSS/Guides/Masking/Clipping)
  - : Giới thiệu về clipping trong CSS, bao gồm thuộc tính `clip-path` với các ví dụ.

- [Giới thiệu về CSS masking](/en-US/docs/Web/CSS/Guides/Masking/Introduction)
  - : Giới thiệu về masking trong CSS, các kiểu mask image khác nhau và hiệu ứng của luminance và alpha-transparency trong masking.

- [Khai báo nhiều mask](/en-US/docs/Web/CSS/Guides/Masking/Multiple_masks)
  - : Giới thiệu về các mask layer và cách khai báo nhiều mask image.

- [Các thuộc tính CSS mask](/en-US/docs/Web/CSS/Guides/Masking/Mask_properties)
  - : Khám phá CSS masking và các thuộc tính component của shorthand `mask`, với giải thích và ví dụ.

## Các khái niệm liên quan

- [`<coord-box>`](/en-US/docs/Web/CSS/Reference/Values/box-edge#values)
- {{cssxref("image")}}
- {{cssxref("&lt;position&gt;")}}
- {{cssxref("url_value", "&lt;url&gt;")}}

- Module [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)
  - {{cssxref("background")}} shorthand
  - {{cssxref("background-origin")}}
  - {{cssxref("background-position")}}
  - {{cssxref("background-repeat")}}
  - {{cssxref("background-size")}}
  - {{cssxref("border-image")}} shorthand
  - {{cssxref("border-image-repeat")}}
  - {{cssxref("border-image-slice")}}
  - {{cssxref("border-image-source")}}
  - {{cssxref("border-image-width")}}
  - Kiểu dữ liệu [`<repeat-style>`](/en-US/docs/Web/CSS/Reference/Properties/background-repeat#values)

- Module [CSS shapes](/en-US/docs/Web/CSS/Guides/Shapes)
  - Kiểu dữ liệu {{cssxref("basic-shape")}}
  - Hàm {{cssxref("basic-shape/polygon","polygon()")}}
  - Kiểu dữ liệu [`<shape-box>`](/en-US/docs/Web/CSS/Reference/Properties/shape-outside#shape-box)

## Đặc tả

{{Specifications}}

## Xem thêm

- {{cssxref("background-clip")}}
- Module [CSS filter effects](/en-US/docs/Web/CSS/Guides/Filter_effects)
- [SVG tutorial: clipping and masking](/en-US/docs/Web/SVG/Tutorials/SVG_from_scratch/Clipping_and_masking)
- {{domxref("CanvasRenderingContext2D.clip()")}}
- {{domxref("WebGLRenderingContext.colorMask()")}}
- [PWA icon masking](/en-US/docs/Web/Progressive_web_apps/How_to/Define_app_icons#support_masking)
