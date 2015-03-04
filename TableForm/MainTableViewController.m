//
//  MainTableViewController.m
//  TableForm
//
//  Created by Scott B Finkelstein on 3/4/15.
//  Copyright (c) 2015 Scott B Finkelstein. All rights reserved.
//

#import "MainTableViewController.h"

@interface MainTableViewController ()
@property (nonatomic, strong) NSArray *fieldsArray;
@property (nonatomic, strong) UITextField *pillNameTextField;
@property (nonatomic, strong) UITextField *refillsRemainTextField;
@property (nonatomic, strong) UITextField *pillsLeftTextField;
@property (nonatomic, strong) UITextField *pharmPhoneTextField;
@property (nonatomic, strong) UITextField *drPhoneTextField;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.fieldsArray=@[@"pillName", @"refillsRemain", @"pillsRemain", @"pharmPhone", @"drPhone"];
    
    [self setupTextFields];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.fieldsArray.count;
}

-(void)setupTextFields {
    self.pillNameTextField=[[UITextField alloc] initWithFrame:CGRectMake(0, 0, 226.0, 48.0)];
    self.pillNameTextField.placeholder=@"Pill Name";
    
    self.refillsRemainTextField=[[UITextField alloc] initWithFrame:CGRectMake(0, 0, 226.0, 48.0)];
    self.refillsRemainTextField.placeholder=@"Number of Refills";
    self.refillsRemainTextField.keyboardType=UIKeyboardTypeNumberPad;
    
    
    self.pillsLeftTextField=[[UITextField alloc] initWithFrame:CGRectMake(0, 0, 226.0, 48.0)];
    self.pillsLeftTextField.placeholder=@"Number of Pills Remaining";
    self.pillsLeftTextField.keyboardType=UIKeyboardTypeNumberPad;
    
    self.pharmPhoneTextField=[[UITextField alloc] initWithFrame:CGRectMake(0, 0, 226.0, 48.0)];
    self.pharmPhoneTextField.placeholder=@"Pharmacy Phone";
    self.drPhoneTextField=[[UITextField alloc] initWithFrame:CGRectMake(0, 0, 226.0, 48.0)];
    self.drPhoneTextField.placeholder=@"Prescribing Doctor Phone";
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad:)],
                           nil];
    [numberToolbar sizeToFit];
    
    self.refillsRemainTextField.inputAccessoryView=numberToolbar;
    self.pillsLeftTextField.inputAccessoryView=numberToolbar;
}

-(void)doneWithNumberPad:(id)sender {
    [self dismissAllKeyboards];
}

-(void)saveData {
    NSLog(@"%@", self.pillNameTextField.text);
}

-(void)dismissAllKeyboards {
    [self.pillNameTextField resignFirstResponder];
    [self.refillsRemainTextField resignFirstResponder];
    [self.pillsLeftTextField resignFirstResponder];
    [self.pharmPhoneTextField resignFirstResponder];
    [self.drPhoneTextField resignFirstResponder];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kCellIdentifier=@"CellID";
    
    UITableViewCell *cell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:kCellIdentifier];
    if (cell == nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellIdentifier];
    }
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (indexPath.row == 0) {
        
        
        cell.textLabel.text=@"Pill Name";
        cell.accessoryView=self.pillNameTextField;
    }else if (indexPath.row == 1){
        cell.textLabel.text=@"Refills:";
        cell.accessoryView=self.refillsRemainTextField;
    }else if (indexPath.row == 2) {
        cell.textLabel.text=@"Pills Left:";
        cell.accessoryView=self.pillsLeftTextField;
    }else if (indexPath.row == 3) {
        cell.textLabel.text=@"Pharmacy Phone:";
        cell.accessoryView=self.pharmPhoneTextField;
    }else if (indexPath.row == 4) {
        cell.textLabel.text=@"Prescribing Dr. Phone:";
        cell.accessoryView=self.drPhoneTextField;
    }
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *buttonView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    UIButton *saveBtn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [saveBtn addTarget:self action:@selector(saveData) forControlEvents:UIControlEventTouchUpInside];
    [saveBtn setTitle:@"Save" forState:UIControlStateNormal];
    saveBtn.frame=CGRectMake(0, 0, 300, 100);
    
    [buttonView addSubview:saveBtn];

    return buttonView;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 100;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
