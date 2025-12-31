const pptxgen = require('pptxgenjs');
const html2pptx = require('/Users/swkim/.claude/skills/pptx/scripts/html2pptx');
const sharp = require('sharp');

async function createGradientBackground() {
  const svg = `<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="562.5">
    <defs>
      <linearGradient id="g" x1="0%" y1="0%" x2="100%" y2="100%">
        <stop offset="0%" style="stop-color:#1C2833"/>
        <stop offset="100%" style="stop-color:#2E4053"/>
      </linearGradient>
    </defs>
    <rect width="100%" height="100%" fill="url(#g)"/>
  </svg>`;

  await sharp(Buffer.from(svg))
    .png()
    .toFile('slides/gradient-bg.png');
}

async function createPresentation() {
  // Create gradient background first
  await createGradientBackground();

  const pptx = new pptxgen();
  pptx.layout = 'LAYOUT_16x9';
  pptx.author = 'Flutter Project';
  pptx.title = 'Flutter 프로젝트 가이드';

  // Slide 1: Title
  await html2pptx('slides/slide1.html', pptx);

  // Slide 2: Overview
  await html2pptx('slides/slide2.html', pptx);

  // Slide 3: Commands
  await html2pptx('slides/slide3.html', pptx);

  // Slide 4: Code Structure
  await html2pptx('slides/slide4.html', pptx);

  // Slide 5: Architecture
  await html2pptx('slides/slide5.html', pptx);

  // Slide 6: SDK Version
  await html2pptx('slides/slide6.html', pptx);

  // Save
  await pptx.writeFile({ fileName: 'Flutter-프로젝트-가이드.pptx' });
  console.log('프레젠테이션이 성공적으로 생성되었습니다!');
}

createPresentation().catch(console.error);
