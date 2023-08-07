## Goals
The goals of the Terragrunt directory structure, in order of importance

1. Change one environment without affecting another
2. DRY - Don't Repeat Yourself
   Keep Terragrunt configuration in one place without repeating the same info in multiple files
3. Isolate production Terragrunt into its own directory structure separate from non-production environments.
   Preventing accidental changes in production (Goal 1) has higher value that DRY (Goal 2)
4. Minimize unexpected change
   Instead of one big Terragrunt state with all the infrastructure in one monolithic directory, 
   we group and separate related infra into its own smaller Terragrunt state directory, i.e. vpc, iam, s3, rds, etc.
   With this separation, changes to one section like iam will not touch an unrelated infra group lke vpc.
   As a added benefit, smaller Terragrunt state will make `terragrunt plan` execute faster.
5. Make the directory structure match the AWS console to reduce cognitive load.
   We generally prefer production to be a separate AWS account from non-production.
   Isolating non-prod and prod into its own directories reinforces that concept.

## Run

`cd (env-name)`, e.g. `cd dev`
`terragrunt run-all [ validate | plan | apply | destroy ]`