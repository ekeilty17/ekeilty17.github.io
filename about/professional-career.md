---
layout: page
title: Professional Career
permalink: /about/professional-career
---

<br>

My current resume and LinkedIn can be found in the sidebar. However, both of these are highly abridged summaries. Below, I give as much detail as I am allowed of my full work experience. Ultimately, though, this may be more for my benefit and personal cataloging than for anyone else.

<br>

---

<br>

<details>
  <summary class="job-summary">
    <h2>
      Forward Deployed AI Engineering - 
      <a href="https://www.ibm.com/products/expertlabs" target="_blank">Expert Labs</a> - 
      <a href="https://www.ibm.com/" target="_blank">IBM</a>
    </h2>
    <span class="post-date work-experience-date">May 2024 - Present</span>
  </summary>

<p>As a forward deployed AI engineering, I was responsible for delivering solutions to IBM clients using IBM's AI platform - <a href="https://www.ibm.com/products/watsonx" target="_blank">watsonx</a>. This includes watsonx.ai, watsonx.data, watsonx.goverance, watsonx Discovery, watsonx Assistant, and watsonx Orchestrate. </p>

<p>This role required both deep technical knowledge and the ability to communicate effectively with technical and non-technical audiences. While a lot of my day-to-day focused on software engineering - writing, testing, debugging, and reviewing code; configuring environments; building CI/CD pipelines; and monitoring production systems - I also took on a variety of client-facing responsibilities. Depending on the project, I gathered requirements and designed solutions, led technical workshops, and occasionally helped develop and present proofs of concept to prospective clients.</p>

<br>

<details markdown="1">
<summary>
  <h3 style="display:inline">UPS - Customer Care Assistant/Agent</h3>
</summary>

<p>UPS has been my longest client. I was on the UPS project for most of my time at IBM.</p> 

<h4>Phase 1 - Classic Chatbot</h4>

<p>The goal of this phase was to quickly deliver a chatbot so UPS could begin seeing returns on its partnership with IBM. This was a traditional software project in which we implemented predefined conversational flows in a chatbot. The solution was built using <a href="https://cloud.ibm.com/apidocs/assistant-v2" target="_blank">watsonx Assistant</a> (before the rise of agentic AI).</p>

<p>My primary contribution was designing and implementing the two largest, most complex, and highest-volume flows: "Where is My Package" and "Delivery Change Request". 

The "Where is My Package" flow tracked UPS shipments and reported their current status to users. The "Delivery Change Request" flow allowed users to modify a shipment by changing the delivery date, delivery address, or pickup location. It also supported payment processing for eligible changes, which introduced additional technical challenges.</p> 

<p>The complexity of the "Where is My Package" flow came from the large number of possible branches, as the conversation needed to handle a different outcome for nearly every package status. The "Delivery Change Request" flow was challenging because of its length and complexity. Since it involved payment, it required identity verification, extensive input validation, and integrations with multiple external services.</p>

<p>Manual testing of either flow was out of the question. Even with sufficient time, the sheer number of possible execution paths meant that human testing would not provide adequate coverage or reliability. To address this, I developed a custom Python-based testing framework to automate validation of these conversational flows during development. The framework proved so effective that it was adopted by the wider team.</p>

<h4>Phase 2 - Multilingual Support</h4>

UPS is a global company, so its chatbot needed to scale to support many languages. Watsonx Assistant did not support multilingual experiences out of the box. Instead, it relied on a more traditional intent and entity recognition system. At the time, the current wave of agentic AI had not yet emerged, but LLMs were already known to be highly effective at translation. We settled on the architecture shown below.

<center>
<div class="overflow-container">
<div class="overflow-content">
<embed src="/img/about/wxa_translation_architecture.png" alt="WxA Translation Architecture" width="550px" />
</div>
</div>
</center>

<p>This architecture offered several advantages. First, it required minimal changes to the existing chatbot, which had already been validated and thoroughly tested. Second, it scaled well. Adding support for a new language did not require any changes to the chatbot's logic; it only required updating the content store and enabling the language in the LLM-based translation layer.</p> 

<p>The primary drawback was reduced debuggability. Cloud logs stored message IDs rather than the localized response text, adding an extra step when tracing conversations or investigating issues. Fortunately, a few custom scripts helped streamline this workflow and mitigated most of the inconvenience.</p> 

<h4>Phase 3 - Custom UI</h4>

<p>Watsonx Assistant includes an out-of-the-box web chat interface that can be embedded into any front end for rapid deployment. Most customers use this web chat as their chatbot UI. However, UPS decided to build a custom interface to better meet its requirements. I helped facilitate its development through pair programming, technical guidance, and support for integrating with the <a href="https://cloud.ibm.com/docs/apis/assistant-v2" target="_blank">watsonx Assistant API</a>.</p> 


<h4>Phase 4 - RAG Search</h4>

<p>Up to this point, the chatbot's behavior had been entirely deterministic. Every user request was handled by predefined conversation flows with predetermined responses. In this phase, we introduced retrieval-augmented generation (RAG) as a fallback mechanism. If a user's utterance did not match any existing flow with sufficient confidence, the chatbot invoked a RAG service instead. The service searched UPS documentation for relevant information, and if it found content that answered the user's question, an LLM generated a response grounded in those retrieved documents.</p>

<p>The RAG service itself was developed collaboratively by IBM and UPS. IBM indexed UPS's documentation using Milvus and managed the LLM responsible for generating grounded responses. UPS built the orchestration layer that coordinated these services and exposed a single backend endpoint consumed by the watsonx Assistant chatbot.</p>

<h4>Phase 5 - Agents</h4>

<p>With the rise of agentic AI and IBM's release of watsonx Orchestrate, the next phase of the project was to migrate from watsonx Assistant to watsonx Orchestrate. Unlike the previous deterministic flow-based chatbot, watsonx Orchestrate enabled conversations to be driven by AI agents, allowing users to complete tasks in a more natural and conversational way.</p>

<p>The migration was performed incrementally and is still ongoing at the time of writing. Initially, only English was supported in watsonx Orchestrate, so users interacting in other languages continued to use the existing watsonx Assistant experience. Likewise, only a subset of conversation flows was migrated at first, meaning requests could be routed to either platform depending on the scenario. Due to IP restrictions and security considerations, I cannot discuss the implementation details. However, designing a hybrid architecture that allowed both platforms to coexist presented a number of interesting technical challenges.</p>

</details>

<br>

<details markdown="1">
<summary>
  <h3 style="display:inline">Marken - Logistics</h3>
</summary>

<h4>Background</h4>

<p>Marken is one of my longest-standing clients. It is a global healthcare logistics company specializing in the transportation of clinical trial materials, biological samples, pharmaceuticals, and other temperature-sensitive medical shipments. Since the time of this project, Marken has become part of UPS Healthcare Precision Logistics through its acquisition by UPS.</p> 

<p>Marken's customers include universities, hospitals, clinical research organizations, study sites, private laboratories, and individual researchers. Unlike traditional parcel carriers such as UPS, Marken operates in a highly specialized logistics space with unique operational challenges.</p> 

<p>Several factors make Marken's business significantly more complex than standard package delivery:

<ul>
  <li><b>Highly customized shipments:</b> Nearly every shipment is tailored to the specific requirements of the customer or clinical study, leaving very few standardized or "general-case" workflows.</li>
  <li><b>Door-to-door service:</b> Without retail storefronts or drop-off locations, every shipment must be carefully coordinated and delivered directly between the sender and recipient.</li>
  <li><b>Strict environmental controls:</b> Many shipments require precise temperature or climate management throughout transit, along with documented evidence that storage conditions remained within acceptable limits.</li>
  <li><b>High-value and high-risk cargo:</b> Marken frequently transports irreplaceable materials such as organs, blood samples, tissue specimens, and investigational drugs, where delays or handling errors can have significant medical, financial, and regulatory consequences.</li>
  <li><b>Complex international compliance:</b> Cross-border shipments often involve extensive customs documentation and regulatory requirements, making international logistics considerably more challenging than conventional freight.</li>
</ul>

</p> 

<h4>Route Generation - Phase 1</h4>

<p>Given a shipment and its associated metadata - such as the customer account, shipment contents, origin, destination, pickup time, required delivery time, and other business constraints - the objective of the route generation engine was to produce an optimal end-to-end route, along with its estimated delivery time and total transportation cost.</p>

<p>At a high level, the given shipment was first used to identify a set of <b>similar historical shipments</b>. The historical routing data from these shipments, combined with real-time APIs and business rules, was used to construct a <b>routing network</b> containing all feasible transportation options for the shipment. This routing network was then optimized to generate a shortlist of candidate end-to-end routes.</p>

<p>The concept of <i>optimal</i> is inherently multi-dimensional. A route that minimizes cost may not minimize transit time, while the fastest route may not be the most reliable or environmentally sustainable. Rather than enforcing a single optimization criterion, we intentionally kept a human-in-the-loop by generating multiple candidate routes, each optimized for a different objective. Operators could then select the route that best aligned with customer priorities and operational requirements.</p>

<p>The optimization objectives were:</p>

<ul>
<li>Most Frequent Historical</li>
<li>Most Recent Historical</li>
<li>Cheapest</li>
<li>Shortest Transit Time</li>
<li>Most Reliable (highest probability of arriving on time)</li>
<li>Most Sustainable (lowest estimated carbon footprint)</li>
</ul>

<p>I was the lead architect and developer for this use case. The detailed technical implementation, including historical shipment matching, routing network construction, and route optimization strategies, is documented separately on a <a href="/about/professional-career/marken-route-generation-phase-1" target="_blank">dedicated page</a>.</p>


<h4>Route Generation - Phase 2</h4>

<p>Phase 2 focused on two primary goals. First, we improved the transparency and accessibility of the internal data processing pipeline, making it easier to inspect and evaluate the inputs and outputs of the route generation system. Second, we introduced additional caching strategies to improve real-time performance. Since many implementation details are IP-restricted, I will focus only on the high-level architecture.</p>

<p>The first component was a historical shipment processing pipeline that performed ETL on historical routing data and transformed it into a format optimized for real-time retrieval. This significantly reduced the lookup time required to identify "similar historical shipments." The pipeline ran on a weekly schedule, incorporating newly observed shipment routes while removing historical data that fell outside the defined retention window.</p>

<p>The second component was a daily caching pipeline for external data sources. Many of the real-time APIs used by the system, such as those for estimating flight costs, do not change frequently enough to require live queries for every route generation request. By refreshing these values on a scheduled basis, we were able to reduce latency while maintaining sufficiently accurate data.</p>

<p>Through these caching strategies and data processing improvements, the construction of the routing network became highly efficient, allowing the complete route generation pipeline to execute in only a few seconds.</p>

<h4>Template Cleaning</h4>

<p>Marken uses the concept of <b>shipment templates</b> for certain accounts and use cases. These templates define pre-approved shipment configurations that have been validated by operational leadership and can be reused for recurring workflows. Over time, Marken accumulated thousands of these templates. However, due to legacy data practices, the templates existed in many different formats, with much of the important information captured as unstructured natural language notes. The goal of this initiative was to consolidate these templates into a consistent, structured data format.</p>

<p>This problem was a strong fit for generative AI. We designed a two-stage pipeline consisting of <b>transformation</b> and <b>validation</b>. During the transformation stage, each field in the unified schema was populated using a combination of deterministic Python logic and LLM-based inference. Deterministic logic was used where rules were well-defined, while LLMs were used to interpret and extract information from unstructured text.</p>

<p>After transformation, each generated field was passed through a validation stage. Validators combined deterministic checks with LLM-based evaluation to verify that extracted values were consistent, plausible, and aligned with the expected schema. This hybrid approach leveraged the strengths of both traditional software engineering and generative AI, providing confidence that the resulting structured templates were accurate and reliable.</p>

</details>

<br>

<details>
<summary>
  <h3 style="display:inline">Dillards - Legal Document Retrieval</h3>
</summary>

<p>On this project, I helped implement a standard Retrieval-Augmented Generation (RAG) architecture that enabled Dillard's legal team to access internal documents more quickly. One of the primary challenges was that the entire solution had to be deployed on-premises, as Dillard's maintains very strict security policies.</p>

<h4>Phase 1 - Elasticsearch</h4>

<p>The initial implementation used Elasticsearch (watsonx Discovery) for vector search and its proprietary ELSER model for relevance scoring. watsonx Orchestrate served as the user interface, providing an LLM-powered assistant that called our RAG backend and summarized the retrieved documents for the user.</p>

<h4>Phase 2 - Milvus</h4>

<p>Following the success of Phase 1, Dillard's decided to scale the solution. Due to the size of the deployment and cost considerations, Milvus was a better fit than Elasticsearch for large-scale vector search. We migrated the vector database to Milvus and built a lightweight Flask API in Python that queried the Milvus backend for document retrieval before calling watsonx.ai to rerank the results using both open-source and custom models. watsonx Orchestrate continued to serve as the user interface.</p>

</details>

<br>

<details>
<summary>
  <h3 style="display:inline">Workshops and Hackathons</h3>
</summary>

<h4>UPS Agentic Workshop</h4>

<p>As a subject matter expert in AI agents, I delivered workshops to multiple UPS teams on the IBM watsonx Orchestrate platform and agentic AI implementation best practices. My presentations covered topics including tools, retrieval-augmented generation (RAG) knowledge bases, credential management, workflow design, and testing and evaluation strategies.</p> 

<h4>Bob Student Hackathon</h4>

<p>I helped organize and host a hackathon for university students, where participants learned how to use IBM Bob (IBM's AI coding assistant) to build an expense tracker application. Students were then challenged to extend the application with creative new features. Projects were evaluated based on innovation, technical implementation, and presentation quality.</p> 

<h4>IBM Internal Bob Workshop</h4>

<p>I played a key role in planning, developing, and delivering this internal workshop, serving as the lead presenter. The workshop introduced IBM Bob (IBM's AI coding assistant) to non-technical IBM employees and demonstrated practical ways they could leverage it to improve productivity and support their day-to-day work.</p> 

</details>

</details>

<br>

---

<br>

<details>
  <summary class="job-summary">
    <h2>
      Full Stack Developer -
      <a href="https://github.com/extropolis" target="_blank">Extropolis</a>
    </h2>
    <span class="post-date work-experience-date">
      May 2023 - May 2024
    </span>
  </summary>

<p>This startup is leverage the power of large language models and diffusion models (GPT, LLaMA, Stable Diffusion, etc.) to create powerful tools and assistants for users. I was a full-stack developer contributing to the products <b>Diffusitron Studio</b> and <b>ChatAF</b>. Diffusitron Studio was a competitor to Midjourney, providing the user a UI for creating, editing, and refining AI generated images. ChatAF was a mobile app which allowed the user to create AI personas which they could chat with. Unfortunately, these products no longer appear to be active.</p>

</details>

<br>

---

<br>

<details>
<summary>
  <h2 style="display:inline">Teaching</h2>
</summary>

<br>

<p>There is an adage that "everyone should work in the service industry". I think equally everyone should teach in some form at least once in their life. To be a good teacher requires you to not only understand the material for yourself, but to understand how others understand the material. This requires a level of empathy that I have not found in any other domain. I hope teaching will always be part of my life in some way.</p>

<br>

<h3>Personal Tutor</h3>
<span class="post-date work-experience-date">2024 - 2025</span>

<p>One or two days of the week after work I tutor high school students in math; typically grade 11 to 12. In Ontario these classes are is called "<a href="https://www.edu.gov.on.ca/eng/curriculum/secondary/math1112currb.pdf#page=45" target="_blank">Functions</a>", "<a href="https://www.edu.gov.on.ca/eng/curriculum/secondary/math1112currb.pdf#page=87" target="_blank">Advanced Functions</a>", and "<a href="https://www.edu.gov.on.ca/eng/curriculum/secondary/math1112currb.pdf#page=101" target="_blank">Calculus and Vectors</a>". In the US this is equivalent to the classes which are typically called "Algebra 2", "Pre-Calculus", and "Calculus 1" (although it varies by state).</p>

<br>

<h3>Teaching Assistant - <a href="https://www.utoronto.ca/" target="_blank">University of Toronto</a></h3>
<span class="post-date work-experience-date">2021 - 2023</span>

During my Master's degree, I was the head TA of the courses <a href="https://engineering.calendar.utoronto.ca/course/ece345h1" target="_blank">ECE345</a>, <a href="https://engineering.calendar.utoronto.ca/course/ece358h1" target="_blank">ECE358</a>, and ECE1762 at the University of Toronto. Below are the exact dates.
<ul>
  <li><b>Sep 2021 - Dec 2021</b>: ECE358 and ECE345</li>
  <li><b>Sep 2022 - Dec 2022</b>: ECE358 and ECE345</li>
  <li><b>Jan 2023 - Apr 2023</b>: ECE1762</li>
</ul> 


<p>All of these courses are minor variants of each other, the broad topic being "Algorithm Design and Data Structures". The textbook used was "<a href="http://mitpress.mit.edu/9780262046305/introduction-to-algorithms/" target="_blank">Introduction to Algorithms</a>" by Thomas H Cormen, Charles E. Leiserson, Ronald L. Rivest, Clifford Stein (canonically referred to as CLRS). These courses were decently large, containing between 200 to 400 students depending on the semester. Here are some examples of the <a href="/files/ECE358 Syllabus Fall 2022.pdf" target="_blank">Syllabus</a> and <a href="/files/ECE358 Weekly Schedule Fall 2022.pdf" target="_blank">Weekly Topic Schedule</a> from the 2022 Fall semester of ECE358.</p>

<p>I don't think I am overstepping when I say that I essentially ran these courses. In all three years, I created all of the homework assignments, the midterm, and the final exam as well as detailed solutions. I also created the rubrics for grading these assessments as well as managing all of the grading TAs. I completely overhauled the tutorial notes, creating a concrete lesson plan for the weekly tutorial sessions. I delivered two out of five tutorial sessions per week. I was the main contributor to responding to student questions via email and the course message board (piazza). Finally, I worked with all of the professors in order to create the Weekly Topic Schedule (example linked above) so that all lecture sections would stay on pace and in sync.</p>

<p>I am extremely proud of how these courses turned out when I was in charge. I took ECE358 during my undergraduate degree and I was disappointed at how poorly it was conducted. I always thought to myself that I could do better. Through my hard work, I reinvigorated these courses with changes that will last long after I've left. Evidenced by my <a href="/about/awards-and-achievements" target="_blank">TA awards</a> these changes were all for the better. I absolutely loved teaching these courses. Delivering the tutorials was one of my favorite parts of completing my Master's degree. Maybe one day I will come back from industry to teach at a university.</p>

<p>(In the future I may include examples of my tutorial notes, homework assignments, and exams. However, this course is still active, so I don't think I am allowed to.)</p>

<br>

<h3>Praxis I and II Teaching Assistant - <a href="https://www.utoronto.ca/" target="_blank">University of Toronto</a></h3>
<span class="post-date work-experience-date">2020 - 2021</span>

<p>At the University of Toronto, <a href="https://engsci.utoronto.ca/program/foundation-years/praxis/" target="_blank">Praxis</a> is the first-year engineering design course. This course has a lot of deliverables and they are all qualitative rather than quantitative. Thus, grading this course of over 300 students becomes quite the task. In my 3rd and 4th year, I became a grading TA of this course. I actually enjoyed it, and it helped me learn best practices when creating qualitative rubrics. These lessons were indispensable when I needed to develop similar types of rubrics as a head TA during my graduate degree.</p>

<br>

<h3>Personal Tutor - <a href="https://www.utoronto.ca/" target="_blank">University of Toronto</a></h3>
<span class="post-date work-experience-date">2019</span>

<p>An engineering student had a unique disability where she could only see things that were about 30 feet away. Any closer or farther, objects would go out of focus. In order to take notes, she needed to project her tablet onto the wall of her dorm room. As a result, she required some assistance to keep up with the classes. One of my first-year professors <a href="https://www.linkedin.com/in/jason-foster-11549438/?originalSubdomain=ca" target="_blank">Jason Foster</a> recommended me to the University of Toronto <a href="https://studentlife.utoronto.ca/department/accessibility-services/" target="_blank">Accessibility Services</a> to be her private tutor.</p>

<p>Two or three times a week, I would meet with this student for about an hour and we would go over the lecture material to make sure she understood it. I love teaching and I love helping people, so I really enjoyed these sessions.</p>

<br>

<h3>Peer Tutor - <a href="https://www.stalux.org/about/" target="_blank">Saint Thomas Aquinas High School</a></h3>
<span class="post-date work-experience-date">2016-2017</span>

<p>My high school had a peer tutoring program where upper-years would go in during their free block in order to help lower-year students with their assignments. I went in during my one free period as a Senior (Junior year I did not have a free period). This program is what sparked my love for teaching and tutoring.</p>

</details>

<br>

---

<br>

<details>
<summary>
  <h2 style="display:inline">Jobs / Internships While in University</h2>
</summary>

<br>

<h3>Poker Dealer - <a href="https://www.theex.com/attractions/casino/" target="_blank">Canadian National Exhibition</a></h3>
<span class="post-date work-experience-date">July 2022 - Sept 2022</span>

<p>A little-known fact about myself is that I love handling cards. For a while, I was into sleight-of-hand magic (that was short-lived). One summer during my Master's degree, I saw an ad for poker dealers and decided...why not? I interviewed and got the job. During the day I worked on my Master's research and at night I worked in the casino dealing poker.</p>

<p>Poker dealing is not for the faint of heart. The players can be very mean (especially when they are losing). However, the environment is super fun and I met so many interesting people. I'm not really into gambling, so this was the only way I could experience casino culture. If you're good with a deck of cards, can do a bit of mental math, and have thick skin, dealing poker is a fun summer job.</p>

<br>

<h3>AI/ML Intern Analyst - <a href="https://www.salesforce.com/" target="_blank">Salesforce</a></h3>
<span class="post-date work-experience-date">Sept 2020 - Dec 2020</span>

<p>As part of my capstone requirement for my undergraduate degree, three other engineering students and I applied for the Salesforce brief. This brief was special because it required us to submit our resumes and Salesforce would choose its group rather than being randomly assigned one. Fortunately, my group was chosen. This means we would become interns at Salesforce, receiving temporary company laptops and attending weekly meetings.</p>

<p>Salesforce had a massive dataset of customer correspondences. Our task was twofold. First, clean this dataset as it was unorganized text files of emails. Second, determine as many insights as possible. For example, which products caused the most confusion? My group utilized NLP and pre-trained models to analyze these customer correspondences and suggested avenues to improve the existing customer support chatbot. Unfortunately, I cannot elaborate on specifics due to the NDA I signed.</p>

<br>

<h3>NLP Researcher - <a href="https://www.utoronto.ca/" target="_blank">University of Toronto</a></h3>
<span class="post-date work-experience-date">May 2020 - Aug 2020</span>

<p>I was lucky enough to do summer research with professor <a href="https://www.ece.utoronto.ca/people/rose-j-s/" target="_blank">Jonathan Rose</a>. After revolutionizing the FPGA industry, he pivoted towards natural language processing (NLP). In particular, he wanted to create chatbots that utilize <a href="https://www.guilford.com/books/Motivational-Interviewing/Miller-Rollnick/9781462552795" target="_blank">Motivational-Interviewing</a> style conversations in order to help people quit smoking.</p>

<p>When I joined the group, my task was to utilize <a href="https://cdn.openai.com/better-language-models/language_models_are_unsupervised_multitask_learners.pdf" target="_blank">GPT-2</a> in pursuit of this goal. We decided to focus on creating high-quality reflections using <a href="https://arxiv.org/abs/2005.14165" target="_blank">few-shot learning</a>. We worked with <a href="https://www.camh.ca/en/science-and-research/science-and-research-staff-directory/peterselby" target="_blank">Dr. Peter Selby</a> at <a href="https://www.camh.ca/" target="_blank">CAMH</a> in order to create examples of reflections approved by practicing clinicians. Then, to generate new reflections, I used semantic similarity in order to find reflections that best matched the new query. These reflections were added to GPT-2's prompt as few-shot examples, and GPT-2 generated a new reflection.</p>

<p>At this time, these language models were still in their infancy. The results with GPT-2 were okay...but not amazing. GPT-3 came out right as I was leaving and the results from it were unbelievable. These days, these language models are even better and still improving. Soon I'm sure they will be indistinguishable from humans or too intelligent to be mistaken for a human.</p>


<br>

<h3>Full Stack Developer - <a href="https://hatchery.engineering.utoronto.ca/team/voco/" target="_blank">AskVoco</a></h3>
<span class="post-date work-experience-date">May 2019 - Jan 2020</span>

<p>This was an extremely small start-up that unfortunately does not exist anymore. They recognized that voice assistants (Alexa, Google Home, Siri, etc.) were being under-utilized. For example (at the time) these assistants could not fetch something as basic as current news. They wanted to create a unified platform where content creators can upload content and have it be discoverable by users (this was the hard part).</p>

<p>I joined the team of four as one of two core developers. As well as helping with miscellaneous back-end and front-end issues, my main project was to implement the (at the time) new neural network <a href="https://arxiv.org/abs/1810.04805" target="_blank">BERT</a> for automatic content classification. At this time, <a href="https://huggingface.co/" target="_blank">HuggingFace</a> was also very new, so they hadn't yet developed their easy-to-use libraries (which made my job much harder).</p>

<p>I only worked for the start-up over the summer and helped out a little during the fall semester. I think it died shortly after due to a lack of funding. Ultimately, I think the idea was good, but they were a bit too ambitious. The technology just wasn't quite there yet. Even today, I think the closest thing to someone solving the discoverability of audio is TikTok. Voice assistants still are not great.</p>

<br>

<h3>Java Back-End Developer - <a href="https://dnastack.com/" target="_blank">DNAstack</a></h3>
<span class="post-date work-experience-date">May 2018 - Aug 2018</span>

<p>In part, DNAstack's goal is to help world health organizations and researchers manage genomic data. At the time I joined, there were many different sources of genomics data, each with different APIs. As part of their platform, DNAstack wanted to unify these data sources. They worked with <a href="https://www.ga4gh.org/" target="_blank">GA4GH</a> to create a standardized API scheme. Strangely, they called this scheme the <i>Data Object Service</i> (DOS) API, which everyone obviously confused with <i>Disc Operating System</i>.</p>

<p>As part of the <a href="https://summerofcode.withgoogle.com/archive/2018/projects" target="_blank">Google Summer of Code 2018</a>, my task was to create the first implementation this API and then write wrappers for popular datasets such as <a href="https://personalgenomes.ca/data" target="_blank">PGP</a>. In doing so, I collaborated with GA4GH and suggested modifications to the standardization in order to better suit the current datasets. You can find my full project <a href="https://summerofcode.withgoogle.com/archive/2018/projects/4858482238947328" target="_blank">here</a>.</p>

<p>This was my first industry job. I learned a lot about the workflow of a developer, how to communicate in a team, and how start-ups work. It was an extremely valuable experience.</p>

</details>

<br>

---

<br>

<details>
<summary>
  <h2 style="display:inline">High School Summer Jobs</h2>
</summary>

<br>

<h3>Waiter and Delivery Guy - <a href="https://www.wmur.com/article/asia-restaurant-dover-new-hampshire-10-5-22/41530947" target="_blank">Dover Asia</a></h3>
<span class="post-date work-experience-date">May 2018 - Aug 2018</span>

<p>I could have done a third summer with UNH. However, I had just finished the most intense semester of my life due to my (successful) drive to become the valedictorian of my high school. Furthermore, at the end of that summer, I was going to begin the hardest engineering program in Canada, which I was anticipating (correctly) to also be extremely intense. Thus, I decided I wanted a more relaxed summer job working in customer service. I walked around downtown Dover (my home town) until I found a help-wanted sign. The staff at Dover Asia were extremely nice and working there meant I got free pork fried rice!</p>

<p>I did a little bit of everything. I helped take orders over the phone, wait tables in the restaurant, pack orders in the kitchen, and deliver orders. A few times I even helped roll sushi! I really enjoyed working there. Interacting on a consistent basis with the "general public" forced me out of my usual bubble and helped me see the world from different perspectives. The few times when I had to deal with rude customers really helped my conflict resolution and de-escalation skills.</p>

<p>Fun fact, this job was the catalyst to my fascination with billiards (pool). The establishment had a large pool room and held weekly events. In the downtime, I would often play against the owner (an older man who could barely see, yet somehow rarely missed a shot). He taught me the fundamentals and I've been hooked ever since. </p>

<br>

<h3>Programming Intern - <a href="https://www.unh.edu/" target="_blank">University of New Hampshire</a></h3>
<span class="post-date work-experience-date">Jun 2015 - Aug 2015 &nbsp; and &nbsp; Jun 2016 - Aug 2016</span>

<p>At this time in my life, I was eager to gain experience as a computer programmer. Luckily, I somehow landed a job working for <a href="https://ccom.unh.edu/user/vschmidt" target="_blank">Val Schmidt</a> at the University of New Hampshire (UNH) <a href="https://ccom.unh.edu/" target="_blank">Center for Coastal & Ocean Mapping/Joint Hydrographic Center</a> in the <a href="https://marine.unh.edu/research-centers/facilities/jere-chase-ocean-engineering-laboratory" target="_blank">Jere A. Chase Ocean Engineering Laboratory</a>. One of their goals is to accurately map the ocean floor. During both summers, I worked on independent projects to help achieve this goal.</p>

<p>In my first summer, I was given the task of developing efficient C++ libraries for their sonar equipment to model refraction in the sound speed profile. The technique used is called <a href="https://en.wikipedia.org/wiki/Ray_tracing_(graphics)" target="_blank">ray tracing</a>. Now, this technique is used by almost all game engines, but at the time was not quite as popular. Unfortunately, this project has been lost to time.</p>

<p>In my second summer, I created a prototype graphical mission planning system for autonomous robotic boats using <a href="https://en.wikipedia.org/wiki/Ray_tracing_(graphics)" target="_blank">Cesium.js</a>. The UI was a globe similar to Google Earth. The tool allowed the user to create various patterns of navigation paths and export the corresponding coordinates. This code can be found on my GitHub <a href="https://github.com/ekeilty17/Cesium_Mission" target="_blank">here</a>. </p>

<br>

<h3>Cart Attendant - <a href="https://www.rochestercc.com/" target="_blank">Rochester Country Club</a></h3>
<span class="post-date work-experience-date">May 2015 - Jun 2015</span>

<p>This was my first job. My main responsibility was to distribute, collect, wash, and maintain golf carts from the members. I would also do whatever other odd job the club pro needed help with. Unfortunately, my employment only lasted about a month because I received an offer to work as a computer programmer at UNH, which I obviously couldn't refuse. Nonetheless, I loved working there and I still love that golf course.</p>

</details>

<br>

---

<br>

<details>
<summary>
  <h2 style="display:inline">Volunteering</h2>
</summary>

<br>

<h3><a href="https://www.tiff.net/" target="_blank">Toronto International Film Festival</a> (TIFF)</h3>
<span class="post-date work-experience-date">Sep 2018 &nbsp; and &nbsp; Sep 2019</span>

<p>The Toronto International Film Festival occurs every year, debuting a variety of films. I volunteered and just helped direct people to their theatre and deal with any conflicts during the showings. It was extremely fun. I highly recommend it to others.</p>

<br>

<h3><a href="https://aquinasathletics.org/main/teamcamps/id/3667087/seasonId/4243872" target="_blank">STA Hockey Pink Game</a></h3>
<span class="post-date work-experience-date">Feb 2016 &nbsp; and &nbsp; Feb 2017</span>

<p>Every year, my high school holds "pink games" for a number of their sports teams as a fundraiser for breast cancer. I (being the captain of the boys varsity hockey team) helped with a lot of the organization of fundraising surrounding our pink game. Obviously, I also played in the game. All proceeds were donated to <a href="https://www.wdhospital.org/wdh2" target="_blank">Wentworth-Douglas Hospital</a>.</p>

<br>

<h3><a href="https://doverchildrenshome.org/" target="_blank">Dover Children's Home</a></h3>
<span class="post-date work-experience-date">2011-2013</span>

<p>For a long time, every other Thursday my mom and I would cook and meal and deliver it to the Dover Children's Home. If we're being honest, my mom was the head chef and I just did my best to help. I remember really enjoying doing this, and I'm not sure why we stopped.</p>

</details>

<br>

---