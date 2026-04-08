---
title: CSS font loading
short-title: Font loading
slug: Web/CSS/Guides/Font_loading
page-type: css-module
spec-urls: https://drafts.csswg.org/css-font-loading/
sidebar: cssref
---

Module **CSS font loading** mô tả các sự kiện và interface được sử dụng để tải động các tài nguyên font.

## Tham chiếu

### Interfaces

- Interface {{domxref("fontFace")}}
  - Constructor [`FontFace()`](/en-US/docs/Web/API/FontFace/FontFace)
  - Thuộc tính {{domxref("fontFace.family")}}
  - Thuộc tính {{domxref("fontFace.style")}}
  - Thuộc tính {{domxref("fontFace.weight")}}
  - Thuộc tính {{domxref("fontFace.stretch")}}
  - Thuộc tính {{domxref("fontFace.unicodeRange")}}
  - Thuộc tính {{domxref("fontFace.variant")}}
  - Thuộc tính {{domxref("fontFace.featureSettings")}}
  - Thuộc tính {{domxref("fontFace.variationSettings")}}
  - Thuộc tính {{domxref("fontFace.display")}}
  - Thuộc tính {{domxref("fontFace.ascentOverride")}}
  - Thuộc tính {{domxref("fontFace.descentOverride")}}
  - Thuộc tính {{domxref("fontFace.lineGapOverride")}}
  - Phương thức {{domxref("fontFace.load()")}} (trả về một promise)
- Interface {{domxref("fontFaceSet")}}
- Sự kiện {{domxref("fontFaceSetLoadEvent")}}

## Hướng dẫn

- [CSS font loading API](/en-US/docs/Web/API/CSS_Font_Loading_API)
  - : Tổng quan về CSS Font Loading API, cung cấp các sự kiện và interface để tải động các tài nguyên font.

## Khái niệm liên quan

- At-rule CSS {{cssxref("@font-face")}}
- At-rule CSS {{cssxref("@font-feature-values")}}
- Interface {{domxref("CSSFontFaceRule")}}
- Thuộc tính Document {{domxref("document.fonts", "fonts")}} (trả về instance đối tượng {{domxref("FontFaceSet")}})
- Thuộc tính WorkerGlobalScope {{domxref("WorkerGlobalScope.fonts", "fonts")}} (trả về instance đối tượng {{domxref("FontFaceSet")}})
- Đối tượng JavaScript {{jsxref("Promise")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS fonts](/en-US/docs/Web/CSS/Guides/Fonts)
