import { Component, OnInit } from '@angular/core';
import { ApiTestService } from 'src/services/api-test.service';

@Component({
  selector: 'app-section',
  templateUrl: './section.component.html',
  styleUrls: ['./section.component.css'],
})
export class SectionComponent implements OnInit {
  cards: any = [];

  constructor(private apiTestService: ApiTestService) {}
  ngOnInit(): void {
    this.apiTestService.listPosts().subscribe({
      next: (response) => {
        console.log(response);
        this.cards = response;
      },
      error: (error) => {
        console.log(error);
      },
    });
  }
}
