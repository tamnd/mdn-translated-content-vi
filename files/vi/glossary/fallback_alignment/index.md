---
title: Fallback alignment
slug: Glossary/Fallback_Alignment
page-type: glossary-definition
sidebar: glossarysidebar
---

Trong [CSS Box Alignment](/en-US/docs/Web/CSS/Guides/Box_alignment), **căn chỉnh dự phòng** (fallback alignment) được chỉ định để xử lý các trường hợp mà căn chỉnh được yêu cầu không thể thực hiện được. Ví dụ, nếu bạn chỉ định `justify-content: space-between` thì phải có nhiều hơn một {{Glossary("alignment subject","đối tượng căn chỉnh")}}. Nếu không có, căn chỉnh dự phòng được sử dụng. Điều này được chỉ định theo từng phương pháp căn chỉnh, như được mô tả chi tiết dưới đây.

- First baseline
  - : `start`
- Last baseline
  - : `safe end`
- Baseline
  - : `start`
- Space-between
  - : `flex-start` (start)
- Space-around
  - : `center`
- Space-evenly
  - : `center`
- Stretch
  - : `flex-start` (start)

## Xem thêm

- [CSS Box Alignment](/en-US/docs/Web/CSS/Guides/Box_alignment)
